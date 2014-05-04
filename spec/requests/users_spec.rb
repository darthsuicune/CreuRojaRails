require 'spec_helper'

describe "Users" do
	subject { response }

	describe "Http requests" do
		before { @user = FactoryGirl.create(:user) }
		describe "without signing in" do
			describe "GET /users" do
				before { get users_path }
				it { should redirect_to(signin_url) }
			end
			describe "individual user" do
				describe "GET /users/:id" do
					before { get user_path( { :id => 1 } ) }
					it { should redirect_to(signin_url) }
				end
				describe "non existing user" do
					before { get user_path( { :id => 5 } ) }
					it { should redirect_to(signin_url) }
				end
			end
			describe "create user" do
				before { get new_user_path }
				it { should redirect_to(signin_url) }
			end
		end
		describe "signed in" do
			before { sign_in @user }
			describe "navigation menu" do
				before { visit users_path }
				subject { page }
				it { should have_content(I18n.t(:user_list_title)) }
				it { should have_content(I18n.t(:logout)) }
			end
		end
	end
  
	describe "Json Requests" do
		before { @user = FactoryGirl.create(:user) }
		describe "without signing in" do
			before { get users_path, { :format => :json } }
			it { should redirect_to(signin_url) }
		end
		describe "signed in" do
			before { sign_in @user }
			describe "user index" do
				before { get users_path, { :format => :json } }
				its(:status) { should be(200) }
				it "has the correct header" do
					response.header['Content-Type'].should include 'application/json'
				end
			end
			describe "individual user" do
				describe "existing user" do
					before { get user_path( { :id => @user.id, :format => :json } ) }
					it "has the correct header" do
						response.header['Content-Type'].should include 'application/json'
					end
					it "shows a restricted Json" do
						json = { :id => @user.id,
									:name => @user.name, 
									:surname => @user.surname,
									:email => @user.email,
									:language => @user.language,
									:role => @user.role,
									:created_at => @user.created_at,
									:updated_at => @user.updated_at }.to_json
						response.body.should == json
					end
				end
				describe "non existing user" do
					before { get user_path( { :id => 5, :format => :json } ) }
					it { should redirect_to(root_url) }
				end
			end
		end
	end
end
