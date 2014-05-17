class UserService < ActiveRecord::Base
	belongs_to :user
	belongs_to :service
	
	validates :user_id, presence: true
	validates :service_id, presence: true
	validates :user_type, presence: true
end