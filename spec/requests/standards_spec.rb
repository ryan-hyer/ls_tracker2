require 'rails_helper'

RSpec.describe "Standards", :type => :request do
  describe "GET /standards" do
    it "works! (now write some real specs)" do
      get standards_path
      expect(response.status).to be(200)
    end
  end
end
