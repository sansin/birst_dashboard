task :update_space_properties  => :environment do
	
	@bc = BirstInterface.new_session
	space_list = []
	SpaceProperty.all.to_a.uniq{|s| space_list  <<  s.space_id}

	Space.all.to_a.uniq{|s| 
		# Get space properties for each space ID and create or update properties to table.
		begin
			space_comments = @bc.get_space_comments :spaceID => s.space_id
		rescue Savon::SOAPFault => e
			p "******** Failed to get properties for space #{s.name}.....#{e}"
			space_status = Space.find_by(space_id: s.space_id)
			space_status.update(is_active: 0)
			p "Updated Space Status to Inactive...."
		rescue HTTPClient::ReceiveTimeoutError => e
			p "Birst session expired => #{e}"
			tries -=1
			if tries >0 
				@bc = BirstInterface.new_session
				retry
			else 
				p "Skipping this space and proceeding with next one..." 
			end 
		end
		if not space_list.include? s.space_id
			SpaceProperty.create(space_id: s.space_id,
							comments: space_comments)
		else
			sp = SpaceProperty.find_by(space_id: s.space_id)
			sp.update(comments: space_comments)
		end
	}
end
