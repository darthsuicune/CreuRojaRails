class Log < ActiveRecord::Base
	belongs_to :user
	
	validates :user_id, presence: true
	validates :action, presence: true
	validates :ip, presence: true
	validates :controller, presence: true
end
