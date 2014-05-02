require 'spec_helper'

describe "users/edit" do
	before(:each) do
		@user = assign(:user, stub_model(User,
			:name => "MyString",
			:surname => "MyString",
			:email => "MyString",
			:password_digest => "MyString",
			:resettoken => "MyString",
			:resettime => 1,
			:language => "MyString",
			:role => "MyString"
		))
	end

	it "renders the edit user form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form[action=?][method=?]", user_path(@user), "post" do
			assert_select "input#user_name[name=?]", "user[name]"
			assert_select "input#user_surname[name=?]", "user[surname]"
			assert_select "input#user_email[name=?]", "user[email]"
			assert_select "select#user_language[name=?]", "user[language]"
			assert_select "select#user_role[name=?]", "user[role]"
		end
	end
end
