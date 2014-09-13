class Resource < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :issues
	has_and_belongs_to_many :categories

	def assign_categories(nums)
		nums.each do |num|
			self.categories << Category.find(num) if num != ""
		end
	end
	def assign_issues(nums)
		nums.each do |num|
			self.issues << Issue.find(num) if num != ""
		end
	end

	def user_name
		if self.user
			self.user.email
		else
			"Anonymous"
		end
	end
	
	def self.search(query)
    results = where("lower(title) like ?", "%#{query.downcase}%")
    p results
    return results
  end

end
