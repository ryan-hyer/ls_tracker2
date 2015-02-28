require 'rails_helper'

RSpec.describe "listings/index", :type => :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        :client_id => 1,
        :category_id => 2,
        :product_description => "MyText",
        :conditions => "MyText",
        :comments => "MyText"
      ),
      Listing.create!(
        :client_id => 1,
        :category_id => 2,
        :product_description => "MyText",
        :conditions => "MyText",
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
