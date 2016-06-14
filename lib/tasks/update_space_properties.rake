task :update_space_properties  => :environment do
	birst_settings_file =  File.expand_path('~/.birstcl')
	Birst_Command.load_settings_from_file(birst_settings_file)
	
	Birst_Command::Session.new do |bc|
		space_list = []
		SpaceProperty.all.to_a.uniq{|s| space_list  <<  s.space_id}

		Space.all.to_a.uniq{|s| 
			# Get space properties for each space ID and create or update properties to table.
			space_comments = bc.get_space_comments :spaceID => s.space_id
			if not space_list.include? s.space_id
				SpaceProperty.create(space_id: s.space_id,
								comments: space_comments)
			else
				sp = SpaceProperty.find_by(space_id: s.space_id)
				sp.update(comments: space_comments)
			end
		}
	end

end
