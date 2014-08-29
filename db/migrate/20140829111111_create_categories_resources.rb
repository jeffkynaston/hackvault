class CreateCategoriesResources < ActiveRecord::Migration
  def change
    create_table :categories_resources do |t|
    	t.integer :category_id
    	t.integer :resource_id

      t.timestamps
    end
  end
end
