require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe LocationsController do

	# This should return the minimal set of attributes required to create a valid
	# Location. As you add validations to Location, be sure to
	# adjust the attributes here as well.
	let(:valid_attributes) { { "name" => "MyString", "address" => "Address", "latitude" => 1.5,
											"longitude" => 1.5, "location_type" => "type" } }

	# This should return the minimal set of values that should be in the session
	# in order to pass any filters (e.g. authentication) defined in
	# LocationsController. Be sure to keep this updated too.
	let(:valid_session) { {} }

	describe "without signin in" do
		subject { page }
		describe "index" do
			before { get :index, {}, valid_session }
			it { should redirect_to(signin_url) }
		end
		describe "show" do
			before { get :show, {:id => 0}, valid_session }
			it { should redirect_to(signin_url) }
		end
		describe "new" do
			before { get :new, {}, valid_session }
			it { should redirect_to(signin_url) }
		end
		describe "edit" do
			before { get :edit, {:id => 0}, valid_session }
			it { should redirect_to(signin_url) }
		end
		describe "create" do
			before { post :create, {:location => valid_attributes}, valid_session }
			it { should redirect_to(signin_url) }
		end
		describe "update" do
			before { put :update, {:id => 0, :location => { "name" => "MyString" }}, valid_session }
			it { should redirect_to(signin_url) }
		end
		describe "destroy" do
			before { delete :destroy, {:id => 0}, valid_session }
			it { should redirect_to(signin_url) }
		end
	end
	
	describe "signed in" do
		let(:user) { FactoryGirl.create(:user) }
		before { sign_in user }

		describe "GET index" do
			it "assigns all locations as @locations" do
				location = Location.create! valid_attributes
				get :index, {}, valid_session
				assigns(:locations).should eq([location])
			end
		end

		describe "GET show" do
			it "assigns the requested location as @location" do
				location = Location.create! valid_attributes
				get :show, {:id => location.to_param}, valid_session
				assigns(:location).should eq(location)
			end
		end

		describe "GET new" do
			it "assigns a new location as @location" do
				get :new, {}, valid_session
				assigns(:location).should be_a_new(Location)
			end
		end

		describe "GET edit" do
			it "assigns the requested location as @location" do
				location = Location.create! valid_attributes
				get :edit, {:id => location.to_param}, valid_session
				assigns(:location).should eq(location)
			end
		end

		describe "POST create" do
			describe "with valid params" do
				it "creates a new Location" do
				expect {
					post :create, {:location => valid_attributes}, valid_session
				}.to change(Location, :count).by(1)
				end

				it "assigns a newly created location as @location" do
				post :create, {:location => valid_attributes}, valid_session
				assigns(:location).should be_a(Location)
				assigns(:location).should be_persisted
				end

				it "redirects to the created location" do
				post :create, {:location => valid_attributes}, valid_session
				response.should redirect_to(Location.last)
				end
			end

			describe "with invalid params" do
				it "assigns a newly created but unsaved location as @location" do
				# Trigger the behavior that occurs when invalid params are submitted
				Location.any_instance.stub(:save).and_return(false)
				post :create, {:location => { "name" => "invalid value" }}, valid_session
				assigns(:location).should be_a_new(Location)
				end

				it "re-renders the 'new' template" do
				# Trigger the behavior that occurs when invalid params are submitted
				Location.any_instance.stub(:save).and_return(false)
				post :create, {:location => { "name" => "invalid value" }}, valid_session
				response.should render_template("new")
				end
			end
		end

		describe "PUT update" do
			describe "with valid params" do
				it "updates the requested location" do
				location = Location.create! valid_attributes
				# Assuming there are no other locations in the database, this
				# specifies that the Location created on the previous line
				# receives the :update_attributes message with whatever params are
				# submitted in the request.
				Location.any_instance.should_receive(:update).with({ "name" => "MyString" })
				put :update, {:id => location.to_param, :location => { "name" => "MyString" }}, valid_session
				end

				it "assigns the requested location as @location" do
				location = Location.create! valid_attributes
				put :update, {:id => location.to_param, :location => valid_attributes}, valid_session
				assigns(:location).should eq(location)
				end

				it "redirects to the location" do
				location = Location.create! valid_attributes
				put :update, {:id => location.to_param, :location => valid_attributes}, valid_session
				response.should redirect_to(location)
				end
			end

			describe "with invalid params" do
				it "assigns the location as @location" do
				location = Location.create! valid_attributes
				# Trigger the behavior that occurs when invalid params are submitted
				Location.any_instance.stub(:save).and_return(false)
				put :update, {:id => location.to_param, :location => { "name" => "invalid value" }}, valid_session
				assigns(:location).should eq(location)
				end

				it "re-renders the 'edit' template" do
				location = Location.create! valid_attributes
				# Trigger the behavior that occurs when invalid params are submitted
				Location.any_instance.stub(:save).and_return(false)
				put :update, {:id => location.to_param, :location => { "name" => "invalid value" }}, valid_session
				response.should render_template("edit")
				end
			end
		end

		describe "DELETE destroy" do
			it "destroys the requested location" do
				location = Location.create! valid_attributes
				expect {
				delete :destroy, {:id => location.to_param}, valid_session
				}.to change(Location, :count).by(-1)
			end

			it "redirects to the locations list" do
				location = Location.create! valid_attributes
				delete :destroy, {:id => location.to_param}, valid_session
				response.should redirect_to(locations_url)
			end
		end
	end

end
