require 'rails_helper'

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
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/License/)
    expect(rendered).to match(/Indicative/)
    expect(rendered).to match(/Vehicle Type/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(/false/)
  end
end
