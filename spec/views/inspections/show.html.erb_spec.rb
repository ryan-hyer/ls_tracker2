require 'rails_helper'

RSpec.describe "inspections/show", :type => :view do
  before(:each) do
    @inspection = assign(:inspection, Inspection.create!(
      :number => "Number",
      :comments => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/MyText/)
  end
end
