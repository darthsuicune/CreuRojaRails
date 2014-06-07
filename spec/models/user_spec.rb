require 'spec_helper'

describe User do
	before { @user = User.new( name: "Example", surname: "Example", email: "user@example.com", 
										role: "volunteer", password: "foobar", password_confirmation: "foobar" ) }
	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:surname) }
	it { should respond_to(:email) }
	it { should respond_to(:role) }
	it { should respond_to(:language) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }
	it { should respond_to(:active) }
	it { should respond_to(:allowed_to?) }
	it { should respond_to(:sessions) }
	it { should respond_to(:user_types) }
	it { should respond_to(:assemblies) }

	it { should be_valid }

	describe "name" do
		describe "is not present" do
			before { @user.name = " " }
			it { should_not be_valid }
		end
		describe "is waaaay too long" do
			before { @user.name = "abcdefghijklmnopqrstuvwxyz" * 4 }
			it { should_not be_valid }
		end
	end
	describe "surname" do
		describe "is not present" do
			before { @user.surname = " " }
			it { should_not be_valid }
		end
		describe "is waaaay too long" do
			before { @user.surname = "abcdefghijklmnopqrstuvwxyz" * 4 }
			it { should_not be_valid }
		end
	end
	describe "email" do
		describe "is not present" do
			before { @user.email = " " }
			it { should_not be_valid }
		end
		describe "format is invalid" do
			it "should be invalid" do
				addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
				addresses.each do |invalid_address|
					@user.email = invalid_address
					@user.should_not be_valid
				end
			end
		end
		describe "format is valid" do
			it "should be valid" do
				addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
				addresses.each do |valid_address|
					@user.email = valid_address
					@user.should be_valid
				end
			end
		end
		describe "is already taken" do
			before do
				user2 = @user.dup
				user2.email = @user.email.upcase
				user2.save
			end
			it { should_not be_valid }
		end
		describe "is not downcased" do
			let(:email1) { "dEnIs@localhost.com" }
			it "should be lower case" do
				@user.email = email1
				@user.save
				@user.reload.email.should == email1.downcase
			end
		end
	end
	describe "password" do
		describe "is not present" do
			before { @user.password = @user.password_confirmation = " " }
			it { should_not be_valid }
		end
		describe "is too short" do
			before { @user.password = @user.password_confirmation = "a" * 5 }
			it { should be_invalid }
		end
		describe "isn't matching confirmation" do
			before { @user.password_confirmation = "mismatch" }
			it { should_not be_valid }
		end
		describe "confirmation is nil" do
			before { @user.password_confirmation = nil }
			it { should_not be_valid }
		end
	end
	describe "return value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by_email(@user.email) }
		describe "with valid password" do
			it { should == found_user.authenticate(@user.password) }
		end
		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }
			it { should_not eq(user_for_invalid_password) }
			specify { user_for_invalid_password .should be_false }
		end
	end
	describe "permission system" do
		describe "admins" do
			before { @user.role = "admin"
						@user.save }
			it { should be_allowed_to(:manage_admin_users) }
			it { should be_allowed_to(:see_own_profile) }
		end
		describe "technicians" do
			before { @user.role = "technician"
						@user.save }
			it { should be_allowed_to(:see_own_profile) }
			it { should be_allowed_to(:manage_technician_users) }
			it { should_not be_allowed_to(:manage_admin_users) }
		end
		describe "volunteers" do
			before { @user.role = "volunteer"
						@user.save }
			it { should be_allowed_to(:see_own_profile) }
			it { should_not be_allowed_to(:manage_technician_users) }
			it { should_not be_allowed_to(:manage_admin_users) }
		end
		describe "a blocked user" do
			before { @user.active = false
						@user.save }
			it { should_not be_allowed_to(:see_own_profile) }
		end
	end
end
