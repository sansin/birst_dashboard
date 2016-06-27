class PropertiesController < ApplicationController
	def index
		@spaces = Space.where(:name => "Internal Coupa Dev - Data Model")
		@space_properties = SpaceProperty.all
		@space_variables = SpaceVariable.all
	end
end
