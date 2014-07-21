require 'rails_helper'

describe "services/show" do
	let(:assembly) {FactoryGirl.create(:location) }
	before(:each) do
		@service = FactoryGirl.create(:service)
	end

	it "renders attributes in <p>" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		expect(rendered).to match(/Name/)
		expect(rendered).to match(/Description/)
		expect(rendered).to match(/Code/)
	end
end
