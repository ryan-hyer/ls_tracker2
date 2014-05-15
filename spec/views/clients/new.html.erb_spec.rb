require 'spec_helper'

describe "clients/new.html.erb" do
  before(:each) do
    assign(:client, stub_model(Client,
      :name => "MyString",
      :address => "MyText",
      :phone => "MyString",
      :website => "MyString",
      :poc_name => "MyString",
      :poc_title => "MyString",
      :poc_phone => "MyString",
      :poc_email => "MyString",
      :invoice_amt => 1,
      :invoice_freq => "MyString",
      :invoice_month => "MyString",
      :listing_number => "MyString",
      :suspended => false,
      :delisted => false,
      :comments => "MyText"
    ).as_new_record)
  end

  it "should render the new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do
      assert_select "input#client_name[name=?]", "client[name]"
      assert_select "textarea#client_address[name=?]", "client[address]"
      assert_select "input#client_phone[name=?]", "client[phone]"
      assert_select "input#client_website[name=?]", "client[website]"
      assert_select "input#client_poc_name[name=?]", "client[poc_name]"
      assert_select "input#client_poc_title[name=?]", "client[poc_title]"
      assert_select "input#client_poc_phone[name=?]", "client[poc_phone]"
      assert_select "input#client_poc_email[name=?]", "client[poc_email]"
      assert_select "input#client_invoice_amt[name=?]", "client[invoice_amt]"
      assert_select "select#client_invoice_freq[name=?]", "client[invoice_freq]"
      assert_select "select#client_invoice_month[name=?]", "client[invoice_month]"
      assert_select "input#client_listing_number[name=?]", "client[listing_number]"
      assert_select "input#client_suspended[name=?]", "client[suspended]"
      assert_select "input#client_delisted[name=?]", "client[delisted]"
      assert_select "textarea#client_comments[name=?]", "client[comments]"
    end
  end
end
