require 'spec_helper.rb'

describe "static_pages/map" do
	let(:user) { FactoryGirl.create(:user) }
	before(:each) do
		view.stub(:current_user) { user }
	end
	it "works?" do
		render 
		
		rendered.should match(/Map/)
		rendered.should match(/<div id="map"/)
	end
end