require 'spec_helper'

describe Service do
	before { @service = FactoryGirl.create(:service) }
	subject { @service }
	
	it { should respond_to(:name) }
	it { should respond_to(:assembly_id) }
	it { should respond_to(:base_time) }
	it { should respond_to(:start_time) }
	it { should respond_to(:end_time) }
end
