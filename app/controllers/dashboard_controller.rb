require 'rake'

class DashboardController < ApplicationController
	def index
		@spaces = Space.where(:is_active => 1, :tracking => "Yes")
		@space_properties = SpaceProperty.all
		@space_variables = SpaceVariable.where(:name => "LoadCompletionTime").order("value")
	end

	def refresh_data
    	# Rake::Task['refresh_space_list'].invoke
    	p "Getting Spaces List"
    	`rake refresh_space_list`
    	p "Updating Space Properties"
    	`rake update_space_properties`
    	p "Updating Space Variables"
    	`rake update_space_variables`
    	redirect_to action: :index
	end

	def ignore_from_list()
    	# Rake::Task['refresh_space_list'].invoke
    	p "Adding space to ignore list"
        space_id = params[:ignore_space_id]
        p space_id
    	sp = Space.find_by(space_id: space_id)
        sp.update(tracking: "No")

    	redirect_to action: :index
	end
end
