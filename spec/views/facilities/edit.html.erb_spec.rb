require 'rails_helper'

RSpec.describe "facilities/edit", :type => :view do
  before(:each) do
    @facility = assign(:facility, Facility.create!(
      :client_id => 1,
      :name => "MyString",
      :address => "MyText",
      :phone => "MyString",
      :poc_name => "MyString",
      :poc_phone => "MyString",
      :poc_email => "MyString",
      :inactive => false,
      :comments => "MyText"
    ))
  end

  it "renders the edit facility form" do
    render

    assert_select "form[action=?][method=?]", facility_path(@facility), "post" do

      assert_select "input#facility_client_id[name=?]", "facility[client_id]"

      assert_select "input#facility_name[name=?]", "facility[name]"

      assert_select "textarea#facility_address[name=?]", "facility[address]"

      assert_select "input#facility_phone[name=?]", "facility[phone]"

      assert_select "input#facility_poc_name[name=?]", "facility[poc_name]"

      assert_select "input#facility_poc_phone[name=?]", "facility[poc_phone]"

      assert_select "input#facility_poc_email[name=?]", "facility[poc_email]"

      assert_select "input#facility_inactive[name=?]", "facility[inactive]"

      assert_select "textarea#facility_comments[name=?]", "facility[comments]"
    end
  end
end
