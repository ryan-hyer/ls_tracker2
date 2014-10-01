require 'rails_helper'

RSpec.describe "categories/index", :type => :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :description => "Description"
      ),
      Category.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
