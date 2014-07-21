require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the VehicleServicesHelper. For example:
#
# describe VehicleServicesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe VehicleServicesHelper do
	describe "get_available_vehicles" do
		let(:service1) { FactoryGirl.create(:service) }
		let(:service2) { FactoryGirl.create(:service) }
		let(:vehicle1) { FactoryGirl.create(:vehicle) }
		let(:vehicle2) { FactoryGirl.create(:vehicle) }
		before { VehicleService.create!(service_id: service1.id, vehicle_id: vehicle1.id) }
		it "should not show busy vehicles" do
			should_result = vehicle2.indicative << ", " << vehicle2.license
			get_available_vehicles(service2).should eq([[should_result, vehicle2.id]])
		end
	end
end
