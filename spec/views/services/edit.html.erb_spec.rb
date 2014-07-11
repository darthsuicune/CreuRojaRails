require 'spec_helper'

describe "services/edit" do
	before(:each) do
		@service = FactoryGirl.create(:service)
	end

	it "renders the edit service form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form[action=?][method=?]", service_path(@service), "post" do
			assert_select "input#service_name[name=?]", "service[name]"
			assert_select "input#service_description[name=?]", "service[description]"
			assert_select "input#service_assembly_id[name=?]", "service[assembly_id]"
			assert_select "input#service_code[name=?]", "service[code]"
		end
	end
end
