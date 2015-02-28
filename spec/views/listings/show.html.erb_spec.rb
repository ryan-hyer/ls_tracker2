require 'rails_helper'

RSpec.describe "listings/show", :type => :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :client_id => 1,
      :category_id => 2,
      :product_description => "MyText",
      :conditions => "MyText",
      :comments => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
