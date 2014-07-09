require 'spec_helper'

describe Invoice do

	let(:client) { FactoryGirl.create(:client) }
	before { @invoice = client.invoices.build }

	subject { @invoice }

	it { should respond_to(:number) }
	it { should respond_to(:client_id) }
	it { should respond_to(:description) }
	it { should respond_to(:amount) }
	it { should respond_to(:date_invoiced) }
	it { should respond_to(:date_paid) }
	it { should respond_to(:client) }
	its(:client) { should eq client }

	it { should be_valid }

	describe "when client id is not present" do
		before { @invoice.client_id = nil }
		it { should_not be_valid }
	end
end
