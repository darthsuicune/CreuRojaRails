require 'spec_helper'

describe "vehicles/show" do
  before(:each) do
    @vehicle = assign(:vehicle, stub_model(Vehicle,
      :brand => "Brand",
      :model => "Model",
      :license => "License",
      :indicative => "Indicative",
      :vehicle_type => "Vehicle Type",
      :places => 1,
      :notes => "Notes",
      :operative => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Brand/)
    rendered.should match(/Model/)
    rendered.should match(/License/)
    rendered.should match(/Indicative/)
    rendered.should match(/Vehicle Type/)
    rendered.should match(/1/)
    rendered.should match(/Notes/)
    rendered.should match(/false/)
  end
end
