class CreateIssuesResources < ActiveRecord::Migration
  def change
    create_table :issues_resources do |t|
    	t.integer :issue_id
    	t.integer :resource_id

      t.timestamps
    end
  end
end
