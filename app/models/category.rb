class Category < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :resources
	has_and_belongs_to_many :issues


	def self.search(query)
    where("lower(title) like ?", "%#{query.downcase}%") 
  end
end
