require 'rails_helper'

RSpec.describe "standards/show", :type => :view do
  before(:each) do
    @standard = assign(:standard, Standard.create!(
      :number => "Number",
      :revision => "Revision"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Revision/)
  end
end
