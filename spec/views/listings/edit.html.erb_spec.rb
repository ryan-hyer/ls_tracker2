require 'rails_helper'

RSpec.describe "listings/edit", :type => :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :client_id => 1,
      :category_id => 1,
      :product_description => "MyText",
      :conditions => "MyText",
      :comments => "MyText"
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input#listing_client_id[name=?]", "listing[client_id]"

      assert_select "input#listing_category_id[name=?]", "listing[category_id]"

      assert_select "textarea#listing_product_description[name=?]", "listing[product_description]"

      assert_select "textarea#listing_conditions[name=?]", "listing[conditions]"

      assert_select "textarea#listing_comments[name=?]", "listing[comments]"
    end
  end
end
