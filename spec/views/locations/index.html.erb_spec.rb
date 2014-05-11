require 'spec_helper'

describe "locations/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :name => "Name",
        :description => "Description",
        :address => "Address",
        :phone => "Phone",
        :latitude => 1.5,
        :longitude => 1.5,
        :location_type => "Location Type",
        :active => false
      ),
      stub_model(Location,
        :name => "Name",
        :description => "Description",
        :address => "Address",
        :phone => "Phone",
        :latitude => 1.5,
        :longitude => 1.5,
        :location_type => "Location Type",
        :active => false
      )
    ])
  end

  it "renders a list of locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Location Type".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
