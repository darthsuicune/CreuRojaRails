require 'rails_helper'

describe "services/index" do
	let(:assembly) { FactoryGirl.create(:location) }
	before(:each) do
		assign(:services, [
			FactoryGirl.create(:service),
			FactoryGirl.create(:service)
		])
	end

	it "renders a list of services" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "tr>td", :text => "Name".to_s, :count => 2
		assert_select "tr>td", :text => "Description".to_s, :count => 2
		assert_select "tr>td", :text => assembly.name, :count => 2
		assert_select "tr>td", :text => "Code".to_s, :count => 2
	end
end
