require 'rails_helper'

RSpec.describe "inspections/edit", :type => :view do
  before(:each) do
    @inspection = assign(:inspection, Inspection.create!(
      :number => "MyString",
      :comments => "MyText"
    ))
  end

  it "renders the edit inspection form" do
    render

    assert_select "form[action=?][method=?]", inspection_path(@inspection), "post" do

      assert_select "input#inspection_number[name=?]", "inspection[number]"

      assert_select "textarea#inspection_comments[name=?]", "inspection[comments]"
    end
  end
end
