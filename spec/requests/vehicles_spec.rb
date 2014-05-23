require 'spec_helper'

describe "Vehicles" do
	describe "without signin in" do
		describe "GET /vehicles" do
			it "redirects to login" do
				get vehicles_path
				response.status.should be(302)
			end
		end
	end
	describe "signed in" do
		let(:user) { FactoryGirl.create(:user) }
		before { sign_in user }
		describe "GET /vehicles" do
			it "shows the vehicle index" do
				# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
				get vehicles_path
				response.status.should be(200)
			end
		end
	end
end