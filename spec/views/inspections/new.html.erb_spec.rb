require 'rails_helper'

RSpec.describe "inspections/new", :type => :view do
  before(:each) do
    assign(:inspection, Inspection.new(
      :number => "MyString",
      :comments => "MyText"
    ))
  end

  it "renders new inspection form" do
    render

    assert_select "form[action=?][method=?]", inspections_path, "post" do

      assert_select "input#inspection_number[name=?]", "inspection[number]"

      assert_select "textarea#inspection_comments[name=?]", "inspection[comments]"
    end
  end
end
