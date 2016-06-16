class AddIsActiveToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :is_active, :integer
  end
end
