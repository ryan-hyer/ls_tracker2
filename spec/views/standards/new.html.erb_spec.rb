require 'rails_helper'

RSpec.describe "standards/new", :type => :view do
  before(:each) do
    assign(:standard, Standard.new(
      :number => "MyString",
      :revision => "MyString"
    ))
  end

  it "renders new standard form" do
    render

    assert_select "form[action=?][method=?]", standards_path, "post" do

      assert_select "input#standard_number[name=?]", "standard[number]"

      assert_select "input#standard_revision[name=?]", "standard[revision]"
    end
  end
end
