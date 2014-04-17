require 'spec_helper'

describe "Static pages" do

	subject { page }

	shared_examples_for "all static pages" do
		it { should have_title("TEi-LS Data Tracker") }
	end

	describe "Home page" do
		before { visit root_path }
		it_should_behave_like "all static pages"
	end

end