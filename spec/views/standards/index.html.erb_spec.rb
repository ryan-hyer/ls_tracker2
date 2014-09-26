require 'rails_helper'

RSpec.describe "standards/index", :type => :view do
  before(:each) do
    assign(:standards, [
      Standard.create!(
        :number => "Number",
        :revision => "Revision"
      ),
      Standard.create!(
        :number => "Number",
        :revision => "Revision"
      )
    ])
  end

  it "renders a list of standards" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Revision".to_s, :count => 2
  end
end
