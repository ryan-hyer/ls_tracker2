require 'spec_helper'

describe "clients/show" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Phone/)
    rendered.should match(/Website/)
    rendered.should match(/Poc Name/)
    rendered.should match(/Poc Title/)
    rendered.should match(/Poc Phone/)
    rendered.should match(/Poc Email/)
    rendered.should match(/1/)
    rendered.should match(/Invoice Freq/)
    rendered.should match(/Invoice Month/)
    rendered.should match(/Listing Number/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
  end
end
