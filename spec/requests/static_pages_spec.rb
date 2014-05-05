require 'spec_helper'

describe "Static Pages" do
	let(:user) { FactoryGirl.create(:user) }
	subject { page }

	shared_examples_for "all static pages" do
		it { should have_content(content) }
		it { should have_title(full_title(page_title)) }
	end

	describe "Contact page" do
		before { visit contact_url }
		let(:page_title) { I18n.t (:contact) }
		let(:content) { I18n.t (:contact) }
		it_should_behave_like "all static pages"
	end
	describe "About page" do
		before { visit about_url }
		let(:page_title) { I18n.t (:about) }
		let(:content) { I18n.t (:about) }
		it_should_behave_like "all static pages"
	end
	
	describe "Map" do
		let(:page_title) { I18n.t (:map) }
		let(:content) { I18n.t(:map) }
		describe "not signed in" do
			before { visit map_url }
			it { should_not have_title(:page_title) }
		end
		describe "signed in" do
			before { sign_in user
			         visit map_url }
			it_should_behave_like "all static pages"
		end
		
	end
end
