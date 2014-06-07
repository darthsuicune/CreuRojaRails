require 'spec_helper'

describe "users/index" do
	before(:each) do
		assign(:users, [
			stub_model(User,
			:name => "Name",
			:surname => "Surname",
			:email => "Email",
			:password_digest => "Password Digest",
			:resettoken => "Resettoken",
			:resettime => 1,
			:language => "Language",
			:role => "Role"
			),
			stub_model(User,
			:name => "Name",
			:surname => "Surname",
			:email => "Email",
			:password_digest => "Password Digest",
			:resettoken => "Resettoken",
			:resettime => 1,
			:language => "Language",
			:role => "Role"
			)
		])
	end

	it "renders a list of users" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "tr>td", :text => "Name Surname".to_s, :count => 2
		assert_select "tr>td", :text => "Email".to_s, :count => 2
		assert_select "tr>td", :text => "Language".to_s, :count => 2
		assert_select "tr>td", :text => "Role".to_s, :count => 2
	end
end
