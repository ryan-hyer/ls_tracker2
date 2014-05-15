require 'spec_helper'

describe "clients/index.html.erb" do
  it "should render a list of clients" do
    assign(:active_clients, [
      stub_model(Client,
        name: "ListedClient",
        listing_number: "11A11",
        delisted: false
      ),
      stub_model(Client,
        name: "ListedClient",
        listing_number: "11A12",
        delisted: false
      ),
      stub_model(Client,
        name: "ListedClient",
        listing_number: "11A13",
        delisted: false
      )
    ])
    assign(:delisted_clients, [     
      stub_model(Client,
        name: "DelistedClient",
        listing_number: "11A14",
        delisted: true
      ),
      stub_model(Client,
        name: "DelistedClient",
        listing_number: "11A15",
        delisted: true
      )
    ])

    render
    assert_select "li", :text => /ListedClient/, :count => 3
    assert_select "li", :text => /DelistedClient/, :count => 2
  end
end
