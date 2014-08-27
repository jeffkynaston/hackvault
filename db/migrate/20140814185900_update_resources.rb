class UpdateResources < ActiveRecord::Migration
  def change
    add_column :resources, :title, :string
    add_column :resources, :description, :text
    add_column :resources, :link, :string
  end
end
