require 'rails_helper.rb'

describe "static_pages/map" do
	it "works?" do
		render 
		
		expect(rendered).to match(/Map/)
		expect(rendered).to match(/<div id="map"/)
	end
end