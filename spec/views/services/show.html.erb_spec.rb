require 'spec_helper'

describe "services/show" do
	let(:assembly) {FactoryGirl.create(:location) }
	before(:each) do
		@service = FactoryGirl.create(:service)
	end

	it "renders attributes in <p>" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		rendered.should match(/Name/)
		rendered.should match(/Description/)
		rendered.should match(/Code/)
	end
end
