require 'spec_helper'

describe "Static Pages" do
	subject { page }

	shared_examples_for "all static pages" do
		it { should have_content(content) }
		it { should have_title(full_title(page_title)) }
	end

	describe "Login page" do
		before { visit root_url }
		let(:page_title) { "" }
		let(:content) { I18n.t (:base_title) }
		it_should_behave_like "all static pages"
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
end
