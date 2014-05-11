require 'spec_helper'

describe "locations/show" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :name => "Name",
      :description => "Description",
      :address => "Address",
      :phone => "Phone",
      :latitude => 1.5,
      :longitude => 1.5,
      :location_type => "Location Type",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/Address/)
    rendered.should match(/Phone/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Location Type/)
    rendered.should match(/false/)
  end
end
