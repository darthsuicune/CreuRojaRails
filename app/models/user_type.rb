class UserType < ActiveRecord::Base
	belongs_to :user
	
	validates :user_id, presence: true
	validates :user_type, presence: true
	
	def self.available_types
		["Type1", "Type2"]
	end
end
