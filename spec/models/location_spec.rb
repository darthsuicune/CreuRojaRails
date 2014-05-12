require 'spec_helper'

describe Location do
	before { @location = FactoryGirl.create(:location) }
	
	subject { @location }
	
	it { should respond_to("latitude") }
	it { should respond_to("longitude") }
	it { should respond_to("name") }
	it { should respond_to("address") }
	it { should respond_to("location_type") }
end
