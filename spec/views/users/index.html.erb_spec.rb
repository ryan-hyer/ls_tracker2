require 'spec_helper'

describe "users/index.html.erb" do
  it "should render a list of users" do
    assign(:users, [
      stub_model(User, email: "a@b.com"),
      stub_model(User, email: "c@d.com")
    ])

    render

    expect(rendered).to match /a@b.com/
    expect(rendered).to match /c@d.com/
  end
end
