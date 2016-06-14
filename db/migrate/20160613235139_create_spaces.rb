class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :space_id, :unique=> true
      t.string :name
      t.string :owner 
      t.timestamps null: false
    end
  end
end
