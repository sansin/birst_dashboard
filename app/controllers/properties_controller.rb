class PropertiesController < ApplicationController
	def index
		# @spaces = Space.where(:name => "Internal Coupa Dev - Data Model")
		space_id = params[:space_id]
        p space_id
        @spaces = Space.where(:space_id => space_id)
		@space_properties = SpaceProperty.all
		@space_variables = SpaceVariable.all

=begin
	 	if (params[:id] && Space.all.collect(&:name).include?(params[:id][:name]))
	    	@spaces = Space.send(params[:id][:name].downcase)
	 	else
	    	@spaces = Space.all
	 	end
		respond_to do |format|
			format.html # index.html.erb
			format.js # index.js.erb
			format.json { render json: @spaces }
		end 
=end
	end
end
