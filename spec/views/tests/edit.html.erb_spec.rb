require 'rails_helper'

RSpec.describe "tests/edit", :type => :view do
  before(:each) do
    @test = assign(:test, Test.create!(
      :number => "MyString",
      :model => "MyString",
      :inspection_id => 1,
      :standard_id => 1,
      :project_id => 1,
      :comments => "MyText"
    ))
  end

  it "renders the edit test form" do
    render

    assert_select "form[action=?][method=?]", test_path(@test), "post" do

      assert_select "input#test_number[name=?]", "test[number]"

      assert_select "input#test_model[name=?]", "test[model]"

      assert_select "input#test_inspection_id[name=?]", "test[inspection_id]"

      assert_select "input#test_standard_id[name=?]", "test[standard_id]"

      assert_select "input#test_project_id[name=?]", "test[project_id]"

      assert_select "textarea#test_comments[name=?]", "test[comments]"
    end
  end
end
