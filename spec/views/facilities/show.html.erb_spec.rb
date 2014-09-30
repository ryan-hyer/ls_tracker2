require 'rails_helper'

RSpec.describe "facilities/show", :type => :view do
  before(:each) do
    @facility = assign(:facility, Facility.create!(
      :client_id => 1,
      :name => "Name",
      :address => "MyText",
      :phone => "Phone",
      :poc_name => "Poc Name",
      :poc_phone => "Poc Phone",
      :poc_email => "Poc Email",
      :inactive => false,
      :comments => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Poc Name/)
    expect(rendered).to match(/Poc Phone/)
    expect(rendered).to match(/Poc Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
  end
end
