class Service < ActiveRecord::Base
	belongs_to :assembly, class_name: "Location", foreign_key: :assembly_id
	
	validates :name, presence: true
	validates :assembly_id, presence: true
	validates :base_time, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
end
