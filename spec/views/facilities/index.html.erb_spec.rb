require 'rails_helper'

RSpec.describe "facilities/index", :type => :view do
  before(:each) do
    assign(:facilities, [
      Facility.create!(
        :client_id => 1,
        :name => "Name",
        :address => "MyText",
        :phone => "Phone",
        :poc_name => "Poc Name",
        :poc_phone => "Poc Phone",
        :poc_email => "Poc Email",
        :inactive => false,
        :comments => "MyText"
      ),
      Facility.create!(
        :client_id => 1,
        :name => "Name",
        :address => "MyText",
        :phone => "Phone",
        :poc_name => "Poc Name",
        :poc_phone => "Poc Phone",
        :poc_email => "Poc Email",
        :inactive => false,
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of facilities" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Poc Name".to_s, :count => 2
    assert_select "tr>td", :text => "Poc Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Poc Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
