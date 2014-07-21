require 'rails_helper'

describe "vehicles/edit" do
  before(:each) do
    @vehicle = assign(:vehicle, stub_model(Vehicle,
      :brand => "MyString",
      :model => "MyString",
      :license => "MyString",
      :indicative => "MyString",
      :vehicle_type => "MyString",
      :places => 1,
      :notes => "MyString",
      :operative => false
    ))
  end

  it "renders the edit vehicle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_path(@vehicle), "post" do
      assert_select "input#vehicle_brand[name=?]", "vehicle[brand]"
      assert_select "input#vehicle_model[name=?]", "vehicle[model]"
      assert_select "input#vehicle_license[name=?]", "vehicle[license]"
      assert_select "input#vehicle_indicative[name=?]", "vehicle[indicative]"
      assert_select "input#vehicle_vehicle_type[name=?]", "vehicle[vehicle_type]"
      assert_select "input#vehicle_places[name=?]", "vehicle[places]"
      assert_select "input#vehicle_notes[name=?]", "vehicle[notes]"
      assert_select "input#vehicle_operative[name=?]", "vehicle[operative]"
    end
  end
end
