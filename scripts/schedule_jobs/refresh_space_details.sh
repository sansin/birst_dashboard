#!/bin/bash
source ~/.bashrc
cd ../../lib/tasks/
export RAILS_ENV=development
bundle exec rake refresh_space_list
bundle exec rake update_space_properties
bundle exec rake update_space_variables
