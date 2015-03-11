require 'rails_helper'

RSpec.describe "tests/index", :type => :view do
  before(:each) do
    assign(:tests, [
      Test.create!(
        :number => "Number",
        :model => "Model",
        :inspection_id => 1,
        :standard_id => 2,
        :project_id => 3,
        :comments => "MyText"
      ),
      Test.create!(
        :number => "Number",
        :model => "Model",
        :inspection_id => 1,
        :standard_id => 2,
        :project_id => 3,
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of tests" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
