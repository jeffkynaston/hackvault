class Resource < ActiveRecord::Base
	belongs_to :user
	belongs_to :issue
	belongs_to :category
end
