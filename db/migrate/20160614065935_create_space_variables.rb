class CreateSpaceVariables < ActiveRecord::Migration
  def change
    create_table :space_variables do |t|
    	t.string :space_id
    	t.string :name
    	t.string :value
    	t.string :type

      t.timestamps null: false
    end
  end
end
