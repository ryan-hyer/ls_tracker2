require 'spec_helper'

describe "static_pages/home.html.erb" do
	it "should have the right title and header" do
		render
		expect(rendered).to match /Home Page/
	end
end