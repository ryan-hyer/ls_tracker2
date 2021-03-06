class Client < ActiveRecord::Base
	has_many :invoices, dependent: :destroy
	has_many :facilities, dependent: :destroy
	
	validates :name, presence: true
	validates :listing_number, presence: true, 
							   uniqueness: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :poc_email, format: { with: VALID_EMAIL_REGEX },
  						  allow_blank: true
  	validates :invoice_month, presence: { if: Proc.new { |client| client.invoice_freq == "Annual" },
  							  message: "can't be blank if invoice frequency is 'Annual'" }

  	def self.due_in(month)
		where("invoice_month = ?", month)
	end
end
