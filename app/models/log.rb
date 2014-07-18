class Log < ActiveRecord::Base
	validates :user_id, presence: true
	validates :action, presence: true
	validates :ip, presence: true
	validates :controller, presence: true
end
