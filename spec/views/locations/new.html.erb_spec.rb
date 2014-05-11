require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location,
      :name => "MyString",
      :description => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :location_type => "MyString",
      :active => false
    ).as_new_record)
  end

  it "renders new location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", locations_path, "post" do
      assert_select "input#location_name[name=?]", "location[name]"
      assert_select "input#location_description[name=?]", "location[description]"
      assert_select "input#location_address[name=?]", "location[address]"
      assert_select "input#location_phone[name=?]", "location[phone]"
      assert_select "input#location_latitude[name=?]", "location[latitude]"
      assert_select "input#location_longitude[name=?]", "location[longitude]"
      assert_select "input#location_location_type[name=?]", "location[location_type]"
      assert_select "input#location_active[name=?]", "location[active]"
    end
  end
end
