class CreateSpaceProperties < ActiveRecord::Migration
  def change
    create_table :space_properties do |t|
    	t.string :space_id
    	t.string :type
    	t.string :sso_enabled
    	t.string :processing_timezone
    	t.float	 :process_engine_version
    	t.string :push_down_to_db
    	t.string :allow_usage_stats
    	t.string :dynamic_groups_for_access
    	t.string :lock_packages
    	t.integer :min_years
    	t.integer :max_years
    	t.string :map_nulls_to_0
    	t.string :email_from
    	t.string :email_subject
    	t.text	 :comments
      	t.timestamps null: false
    end
  end
end
