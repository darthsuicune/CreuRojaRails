require 'spec_helper'

describe "users/show" do
	before(:each) do
		@user = FactoryGirl.create(:user)
	end

	it "renders attributes in <p>" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		rendered.should match(/[Name|Nombre]/)
		rendered.should match(/[Surname|Apellido]/)
		rendered.should match(/[E-mail|Correo]/)
		rendered.should match(/[Language|Idioma]/)
		rendered.should match(/Rol/)
	end
end
