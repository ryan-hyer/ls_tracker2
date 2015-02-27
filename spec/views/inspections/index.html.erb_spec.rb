require 'rails_helper'

RSpec.describe "inspections/index", :type => :view do
  before(:each) do
    assign(:inspections, [
      Inspection.create!(
        :number => "Number",
        :comments => "MyText"
      ),
      Inspection.create!(
        :number => "Number",
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of inspections" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
