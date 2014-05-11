require 'spec_helper'

describe "services/new" do
  before(:each) do
    assign(:service, stub_model(Service,
      :name => "MyString",
      :description => "MyString",
      :assembly_id => 1,
      :code => "MyString"
    ).as_new_record)
  end

  it "renders new service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", services_path, "post" do
      assert_select "input#service_name[name=?]", "service[name]"
      assert_select "input#service_description[name=?]", "service[description]"
      assert_select "input#service_assembly_id[name=?]", "service[assembly_id]"
      assert_select "input#service_code[name=?]", "service[code]"
    end
  end
end
