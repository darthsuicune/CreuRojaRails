require 'rails_helper'

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
			subject { page }
			describe "navigation menu" do
				before { visit users_path }
				it { should have_content(I18n.t(:user_list_title)) }
				it { should have_content(I18n.t(:logout)) }
			end
			describe "individual user" do
				describe "GET /users/:id" do
					before { get user_path( { :id => @user.id } ) }
					it { should have_content(@user.name) }
					it { should have_content(@user.surname) }
					it { should have_content(@user.email) }
				end
				describe "non existing user" do
					it "should raise a RecordNotFound error" do
						expect { 
							get user_path( { :id => 555 } ) 
						}.to raise_error(ActiveRecord::RecordNotFound)
					end
				end
			end
			describe "create user" do
				before { get new_user_path }
			end
		end
	end
  
	describe "Json Requests" do
		let(:user) { FactoryGirl.create(:user) }
		let(:admin) { FactoryGirl.create(:admin) }
		describe "without signing in" do
			before { get users_path, { :format => :json } }
			it "should be unauthorized" do
				expect(status).to eq(401)
			end
			it "is a json response" do
				expect(response.header['Content-Type']).to include 'application/json'
			end
			it "does not display the users" do
				expect(body).not_to eq([user, admin])
			end
			it "does render a response" do
				expect(body).to match("unauthorized")
			end
		end
		describe "signed in" do
			#TODO: Add token to request
			let(:invalid_request) { { :format => :json, token: "asdfasdfasdf" } }
			before {
				admin.create_session_token
				@valid_request =  { :format => :json, token: admin.sessions.last.token }
			}
			
			describe "user index" do
				before { get users_path, @valid_request  }
				it "has the correct header" do
					expect(response.header['Content-Type']).to include 'application/json'
				end
				it "returns the users list" do
					expect(body).to eq([user,admin])
				end
				it "should be authorized" do
					expect(status).to eq(200)
				end
			end
			describe "individual user" do
				describe "existing user" do
					before { 
						get user_path( {:id => user.id}), @valid_request 
					}
					it "has the correct header" do
						expect(response.header['Content-Type']).to include 'application/json'
					end
					it "should be authorized" do
						expect(status).to eq(200)
					end
					it "shows a restricted Json" do
						json = { :id => user.id,
									:name => user.name, 
									:surname => user.surname,
									:email => user.email,
									:language => user.language,
									:role => user.role,
									:created_at => user.created_at,
									:updated_at => user.updated_at }.to_json
						expect(body).to eq(json)
					end
				end
				describe "non existing user" do
					it "should raise an error" do
						expect {
							get user_path( {id: 555} ), @valid_request
						}.to raise_error(ActiveRecord::RecordNotFound)
					end
				end
			end
		end
	end
end
