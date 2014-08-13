class Log < ActiveRecord::Base
	belongs_to :user
	
	validates :user_id, presence: true
	validates :action, presence: true
	validates :ip, presence: true
	validates :controller, presence: true
	
	def self.create(user_id, controller_name, action_name, ip)
		log = Log.new
		log.controller = controller_name
		log.action = action_name
		log.ip = ip
		log.save
	end
end
