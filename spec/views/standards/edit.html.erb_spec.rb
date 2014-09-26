require 'rails_helper'

RSpec.describe "standards/edit", :type => :view do
  before(:each) do
    @standard = assign(:standard, Standard.create!(
      :number => "MyString",
      :revision => "MyString"
    ))
  end

  it "renders the edit standard form" do
    render

    assert_select "form[action=?][method=?]", standard_path(@standard), "post" do

      assert_select "input#standard_number[name=?]", "standard[number]"

      assert_select "input#standard_revision[name=?]", "standard[revision]"
    end
  end
end
