require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :surname => "Surname",
      :email => "Email",
      :password_digest => "Password Digest",
      :resettoken => "Resettoken",
      :resettime => 1,
      :language => "Language",
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Surname/)
    rendered.should match(/Email/)
    rendered.should match(/Language/)
    rendered.should match(/Role/)
  end
end
