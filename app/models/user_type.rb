class UserType < ActiveRecord::Base
	belongs_to :user
	
	validates :user_id, presence: true
	validates :user_type, presence: true
	
	def self.available_types
		[["type1", I18n.t(:type1)], ["type2", I18n.t(:type2)]]
	end
end
