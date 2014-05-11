require 'spec_helper'

describe Service do
	before { @user = FactoryGirl.create(:service) }
	subject { @user }
	
	it { should respond_to(:end_time) }
end
