require 'spec_helper'

describe "users/show" do
	before(:each) do
		@user = FactoryGirl.create(:user)
	end

	it "renders attributes in <p>" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		rendered.should match(/Name/)
		rendered.should match(/Surname/)
		rendered.should match(/E-mail/)
		rendered.should match(/Language/)
		rendered.should match(/Role/)
	end
end
