class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :title
    	t.text :description

      t.timestamps
    end

      t.timestamps
    end
  end
end
