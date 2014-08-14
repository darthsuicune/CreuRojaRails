require 'rails_helper'

RSpec.describe UserVehicle, :type => :model do
	let(:user_vehicle) { FactoryGirl.create(:user_vehicle) }
	subject { user_vehicle }
	
	it { should respond_to :user_id }
	it { should respond_to :vehicle_id }
	it { should respond_to :service_id }
	it { should respond_to :user_position }
end
