require "rails_helper"

RSpec.describe StandardsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/standards").to route_to("standards#index")
    end

    it "routes to #new" do
      expect(:get => "/standards/new").to route_to("standards#new")
    end

    it "routes to #show" do
      expect(:get => "/standards/1").to route_to("standards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/standards/1/edit").to route_to("standards#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/standards").to route_to("standards#create")
    end

    it "routes to #update" do
      expect(:put => "/standards/1").to route_to("standards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/standards/1").to route_to("standards#destroy", :id => "1")
    end

  end
end
