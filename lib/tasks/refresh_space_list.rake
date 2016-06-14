task :refresh_space_list  => :environment do
	birst_settings_file =  File.expand_path('~/.birstcl')
	Birst_Command.load_settings_from_file(birst_settings_file)
	Birst_Command::Session.new do |bc|
		@something = bc.list_spaces
	end

	space_list = []
	Space.all.to_a.uniq{|s| space_list  <<  s.name}
	p space_list

	@something[:user_space].each do |space_hsh|
		if not space_list.include? space_hsh[:name]
			Space.create(name: space_hsh[:name],
					 space_id: space_hsh[:id],
					 owner: space_hsh[:owner])
		end
	end
end