require 'spec_helper'

describe VehicleServicesController do
	let(:vehicle) { FactoryGirl.create(:vehicle) }
	let(:service) { FactoryGirl.create(:service) }
	let(:user) { FactoryGirl.create(:user, role: "admin") }
	
	let(:valid_attributes) { { "vehicle_id" => vehicle.id, "service_id" => service.id } }
	let(:valid_session) { {} }
	before { sign_in user }
	
	describe "POST create" do
		it "creates a new VehicleService" do
			expect {
				post :create, { :vehicle_service => valid_attributes }, valid_session
			}.to change(VehicleService, :count).by(1)
		end
	end
end