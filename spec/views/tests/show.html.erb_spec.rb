require 'rails_helper'

RSpec.describe "tests/show", :type => :view do
  before(:each) do
    @test = assign(:test, Test.create!(
      :number => "Number",
      :model => "Model",
      :inspection_id => 1,
      :standard_id => 2,
      :project_id => 3,
      :comments => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
  end
end
