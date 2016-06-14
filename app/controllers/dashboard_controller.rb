class DashboardController < ApplicationController
	def index
		@spaces = Space.all
		@space_properties = SpaceProperty.all
		@space_variables = SpaceVariable.where(:name => "LoadCompletionTime").order("value")
	end
end
