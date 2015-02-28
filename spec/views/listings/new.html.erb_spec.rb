require 'rails_helper'

RSpec.describe "listings/new", :type => :view do
  before(:each) do
    assign(:listing, Listing.new(
      :client_id => 1,
      :category_id => 1,
      :product_description => "MyText",
      :conditions => "MyText",
      :comments => "MyText"
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input#listing_client_id[name=?]", "listing[client_id]"

      assert_select "input#listing_category_id[name=?]", "listing[category_id]"

      assert_select "textarea#listing_product_description[name=?]", "listing[product_description]"

      assert_select "textarea#listing_conditions[name=?]", "listing[conditions]"

      assert_select "textarea#listing_comments[name=?]", "listing[comments]"
    end
  end
end
