class Client < ActiveRecord::Base
	validates :name, presence: true
	VALID_LISTING_REGEX = /\A\d{2}[A-L]\d{2}\z/
	validates :listing_number, presence: true, 
							   uniqueness: true,
							   format: { with: VALID_LISTING_REGEX }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :poc_email, format: { with: VALID_EMAIL_REGEX }
  	validates :invoice_month, presence: true, 
  							  if: Proc.new { |client| client.invoice_freq == "Annual" }
end
