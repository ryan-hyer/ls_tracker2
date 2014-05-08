require 'spec_helper'

describe "clients/index" do
  before(:each) do
    assign(:clients, [
      stub_model(Client,
        :name => "Name",
        :address => "MyText",
        :phone => "Phone",
        :website => "Website",
        :poc_name => "Poc Name",
        :poc_title => "Poc Title",
        :poc_phone => "Poc Phone",
        :poc_email => "Poc Email",
        :invoice_amt => 1,
        :invoice_freq => "Invoice Freq",
        :invoice_month => "Invoice Month",
        :listing_number => "Listing Number",
        :suspended => false,
        :delisted => false,
        :comments => "MyText"
      ),
      stub_model(Client,
        :name => "Name",
        :address => "MyText",
        :phone => "Phone",
        :website => "Website",
        :poc_name => "Poc Name",
        :poc_title => "Poc Title",
        :poc_phone => "Poc Phone",
        :poc_email => "Poc Email",
        :invoice_amt => 1,
        :invoice_freq => "Invoice Freq",
        :invoice_month => "Invoice Month",
        :listing_number => "Listing Number",
        :suspended => false,
        :delisted => false,
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of clients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Poc Name".to_s, :count => 2
    assert_select "tr>td", :text => "Poc Title".to_s, :count => 2
    assert_select "tr>td", :text => "Poc Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Poc Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Invoice Freq".to_s, :count => 2
    assert_select "tr>td", :text => "Invoice Month".to_s, :count => 2
    assert_select "tr>td", :text => "Listing Number".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
