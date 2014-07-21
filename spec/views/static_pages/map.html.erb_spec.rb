require 'rails_helper.rb'

describe "static_pages/map" do
	let(:user) { FactoryGirl.create(:user) }
	before(:each) do
		expect(view).to receive(:current_user) { user }
	end
	it "works?" do
		render 
		
		expect(rendered).to match(/Map/)
		expect(rendered).to match(/<div id="map"/)
	end
end