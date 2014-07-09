require 'spec_helper'

describe "invoices/new" do
  before(:each) do
    assign(:invoice, stub_model(Invoice,
      :number => "MyString",
      :client_id => 1,
      :description => "MyString",
      :amount => 1.5
    ).as_new_record)
  end

  it "renders new invoice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invoices_path, "post" do
      assert_select "input#invoice_number[name=?]", "invoice[number]"
      assert_select "input#invoice_client_id[name=?]", "invoice[client_id]"
      assert_select "input#invoice_description[name=?]", "invoice[description]"
      assert_select "input#invoice_amount[name=?]", "invoice[amount]"
    end
  end
end
