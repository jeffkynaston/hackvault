class UpdateResources < ActiveRecord::Migration
  def change
    add_column :resources, :user_id, :integer
    add_column :resources, :issue_id, :integer
    add_column :resources, :category_id, :integer
  end
end
