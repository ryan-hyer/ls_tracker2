require 'spec_helper'

describe Client do

  before do
    @client = Client.new(name: "Test",
		                 address: "somewhere\r\nover\r\nthe\r\nrainbow", 
		                 phone: "123-456-7890", 
		                 website: "www.foo.com",
		                 poc_name: "Jim", 
		                 poc_title: "Prez", 
		                 poc_phone: "", 
		                 poc_email: "jim@foo.bar", 
		                 invoice_amt: 1500, 
		                 invoice_freq: "Monthly", 
		                 invoice_month: "July", 
		                 listing_number: "11K23", 
		                 effective: "2014-05-08", 
		                 updated: "2014-05-08", 
		                 expires: "2014-05-08", 
		                 suspended: false, 
		                 delisted: false, 
		                 comments: "This is only a test.")
  end

  subject { @client }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:phone) }
  it { should respond_to(:website) }
  it { should respond_to(:poc_name) }
  it { should respond_to(:poc_title) }
  it { should respond_to(:poc_phone) }
  it { should respond_to(:poc_email) }
  it { should respond_to(:invoice_amt) }
  it { should respond_to(:invoice_freq) }
  it { should respond_to(:invoice_month) }
  it { should respond_to(:listing_number) }
  it { should respond_to(:effective) }
  it { should respond_to(:updated) }
  it { should respond_to(:expires) }
  it { should respond_to(:suspended?) }
  it { should respond_to(:delisted?) }
  it { should respond_to(:comments) }

  it { should be_valid }

  describe "when name is not present" do
    before { @client.name = " " }
    it { should_not be_valid }
  end

  describe "when listing number is not present" do
    before { @client.listing_number = " " }
    it { should_not be_valid }
  end

  describe "when listing number format is invalid" do
    it "should be invalid" do
      listing_numbers = %w[3 A13C BC3EF 11P11 11A112 11a11]
      listing_numbers.each do |invalid_listing|
        @client.listing_number = invalid_listing
        expect(@client).not_to be_valid
      end
    end
  end

  describe "when listing number format is valid" do
    it "should be valid" do
      listing_numbers = %w[11A11 04L02]
      listing_numbers.each do |valid_listing|
        @client.listing_number = valid_listing
        expect(@client).to be_valid
      end
    end
  end

  describe "when listing number is already taken" do
    before do
      client_with_same_listing_number = @client.dup
      client_with_same_listing_number.listing_number = @client.listing_number.upcase
      client_with_same_listing_number.save
    end

    it { should_not be_valid }
  end

  describe "when invoice frequency is annual and invoice month is blank" do
    it "should not be valid" do
      @client.invoice_freq = "Annual"
      @client.invoice_month = ""
      expect(@client).not_to be_valid
    end
  end
end