require 'spec_helper'

describe Vehicle do
	before { @vehicle = FactoryGirl.create(:vehicle) }
	subject { @vehicle }
	
	it { should respond_to("brand") }
	it { should respond_to("model") }
	it { should respond_to("license") }
	it { should respond_to("vehicle_type") }
	it { should respond_to("places") }
	it { should respond_to("services") }
end