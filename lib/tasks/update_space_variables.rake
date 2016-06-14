task :update_space_variables  => :environment do
	birst_settings_file =  File.expand_path('~/.birstcl')
	Birst_Command.load_settings_from_file(birst_settings_file)
	
	Birst_Command::Session.new do |bc|
		var_list = []
		# Get list of spaces from space_variables tables and concat space_id+name into var_list array
		SpaceVariable.all.to_a.uniq{|v| var_list  <<  v.space_id+v.name}
		#Iterate thru list of spaces and for each space, get list of variables
		space_exceptions = {}
		Space.all.to_a.uniq{|s| 
			space_variables = bc.get_variables_for_space :spaceID => s.space_id
			# sample output space_variable = result: { array_of_string: [ { string: [ "LoadInitiatedTime", "6/13/2016 4:21 PM" ] }, { string: [ "LoadDate", "6/13/2016" ] } ] }
			# paste it in json parser (http://jsonviewer.stack.hu/) to see format properly. Paste it without "result:"
			# Iterate thru list of variables for given space, check if space_id, var_name exist. If not, insert else update value
			p space_variables
			if space_variables
				space_variables[:array_of_string].each { |e|
					begin
						var_name = e[:string][0].to_s
						var_value = e[:string][1].to_s
					rescue TypeError
						var_name = e[0][0].to_s
						var_value = e[0][1].to_s
						space_exceptions.merge!(space_id: s.space_id, var_name: var_name, var_value: var_value)
					end
					if not var_list.include? s.space_id+var_name
						SpaceVariable.create(space_id: s.space_id,
											name: var_name,
											value: var_value)
					else
						sp = SpaceVariable.find_by(space_id: s.space_id, name: var_name)
						sp.update(value: var_value)
					end

				}
			end
		}
		p space_exceptions
	end

end
