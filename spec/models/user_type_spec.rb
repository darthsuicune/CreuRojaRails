require 'spec_helper'

describe UserType do
  let(:user_type) { FactoryGirl.create(:user_type) }
  subject { user_type }
  
  it { should respond_to(:user) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user_type) }
end
