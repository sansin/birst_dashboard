class AddTrackingToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :tracking, :string
  end
end
