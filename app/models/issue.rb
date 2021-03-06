class Issue < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :resources
	has_and_belongs_to_many :categories

	def assign_categories(nums)
		nums.each do |num|
			self.categories << Category.find(num) if num != ""
		end
	end

	def user_name
		if self.user
			self.user.email
		else
			"Anonymous"
		end
	end
end
