task :first_time_updates  => :environment do
	@update_spaces = Space.where('name LIKE ? OR name LIKE ?', '%EAP%','%DEV%').all
	@update_spaces.each {|e| 
		begin
			space_details = Space.find_by(space_id: e[:space_id])
			space_details.update(tracking: "No", is_active: 1)
		rescue NoMethodError => e
			p "Unable to update : #{e}"
		end
	}
end
