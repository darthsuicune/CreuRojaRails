require 'spec_helper'

describe Session do
	before { @user = FactoryGirl.create(:user) }
	before { @session = FactoryGirl.create(:session) }
	subject { @session }
	
	it { should respond_to(:user) }
	it { should respond_to(:token) }
	
	describe "should be invalid" do
		describe "without user_id" do
			before { @session.user_id = nil }
			it { should_not be_valid }
		end
		describe "without token" do
			before { @session.token = nil }
			it { should_not be_valid } 
		end
	end
end
