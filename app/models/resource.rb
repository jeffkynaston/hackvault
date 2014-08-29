class Resource < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :issues
	has_and_belongs_to_many :categories
end
