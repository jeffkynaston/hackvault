class Category < ActiveRecord::Base
	has_and_belongs_to_many :resources
	has_and_belongs_to_many :issues

	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
  end
end
