require 'rails_helper'

describe "locations/show" do
	before(:each) do
		@location = FactoryGirl.create(:location)
	end

	it "renders attributes in <p>" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		expect(rendered).to match(/Name/)
		expect(rendered).to match(/Description/)
		expect(rendered).to match(/Address/)
		expect(rendered).to match(/Phone/)
		expect(rendered).to match(/1.5/)
		expect(rendered).to match(/1.5/)
		expect(rendered).to match(/Location type/)
		expect(rendered).to match(/false/)
	end
end
