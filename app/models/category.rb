class Category < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :resources
	has_and_belongs_to_many :issues


	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") || where("title like ?", "%#{query.capitalize}%") 
  end
end
