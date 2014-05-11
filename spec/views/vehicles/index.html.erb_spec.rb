require 'spec_helper'

describe "vehicles/index" do
  before(:each) do
    assign(:vehicles, [
      stub_model(Vehicle,
        :brand => "Brand",
        :model => "Model",
        :license => "License",
        :indicative => "Indicative",
        :vehicle_type => "Vehicle Type",
        :places => 1,
        :notes => "Notes",
        :operative => false
      ),
      stub_model(Vehicle,
        :brand => "Brand",
        :model => "Model",
        :license => "License",
        :indicative => "Indicative",
        :vehicle_type => "Vehicle Type",
        :places => 1,
        :notes => "Notes",
        :operative => false
      )
    ])
  end

  it "renders a list of vehicles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "License".to_s, :count => 2
    assert_select "tr>td", :text => "Indicative".to_s, :count => 2
    assert_select "tr>td", :text => "Vehicle Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
