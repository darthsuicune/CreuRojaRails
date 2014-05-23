require 'spec_helper'

describe "Locations" do
	describe "without signin in" do
		describe "GET /locations" do
			it "redirects to login" do
				get locations_path
				response.status.should be(302)
			end
		end
	end
	describe "signed in" do
		let(:user) { FactoryGirl.create(:user) }
		before { sign_in user }
		describe "GET /locations" do
			it "shows the location index" do
				# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
				get locations_path
				response.status.should be(200)
			end
		end
	end
end
