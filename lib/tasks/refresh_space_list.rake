task :refresh_space_list  => :environment do
	@bc = BirstInterface.new_session

	@something = @bc.list_spaces

	space_list = []
	Space.uniq.map{|s| space_list  <<  s.name}
	p space_list

	@something[:user_space].each do |space_hsh|
		space_hsh = Hash[*space_hsh.flatten(1)]
		unless space_list.include? space_hsh[:name]
			Space.create(name: space_hsh[:name],
					 space_id: space_hsh[:id],
					 owner: space_hsh[:owner],
					 tracking: "Yes",
					 is_active: 1)
		else
			space_details = Space.find_by(space_id: space_hsh[:id])
			space_details.update(tracking: "Yes", is_active: 1)
		end
	end
end
