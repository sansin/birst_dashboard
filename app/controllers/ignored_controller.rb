class IgnoredController < ApplicationController
	def index
		@ignored_spaces = Space.where(:is_active => 1, :tracking => "No")
		@space_properties = SpaceProperty.all
		@space_variables = SpaceVariable.where(:name => "LoadCompletionTime").order("value")
	end

	def add_to_list()
    	# Rake::Task['refresh_space_list'].invoke
    	p "Adding space to tracking list"
        space_id = params[:add_space_id]
        p space_id
    	#ignore_spaces = 
    	redirect_to action: :index
	end
end
