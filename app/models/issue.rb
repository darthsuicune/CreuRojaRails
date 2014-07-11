class Issue < ActiveRecord::Base
	
	before_validation :defaults
	
	validates :status, presence: true
	validates :severity, presence: true
	validates :short_description, presence: true
	validates :long_description, presence: true
	validates :component, presence: true
	
	private
	def defaults
		status = t(:issue_status_new)
		severity ||= t(:issue_severity_normal)
	end
end
