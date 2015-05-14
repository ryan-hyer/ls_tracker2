class Client < ActiveRecord::Base
	has_many :invoices, dependent: :destroy
	has_many :facilities, dependent: :destroy
	has_many :listings, dependent: :destroy
	has_many :amendments, dependent: :destroy
	
	validates :name, presence: true
	validates :listing_number, presence: true, 
							   uniqueness: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :poc_email, format: { with: VALID_EMAIL_REGEX },
						  allow_blank: true
	validates :invoice_month, presence: { if: Proc.new { |client| client.invoice_freq == "Annual" },
							  message: "can't be blank if invoice frequency is 'Annual'" }

	default_scope { order("name") }
	scope :delisted, -> { where(delisted: true) }
	scope :active, -> { where(delisted: false) }

	def self.due_in(month)
		monthname = month.gsub(/\d+/,"")
		sqlString = "(invoice_freq = 'Annual' AND invoice_month = ?) OR (invoice_freq = 'Monthly')"
		sqlString << " OR (invoice_freq = 'Quarterly')" if ['January','April','July','October'].include?(monthname)
		active.where(sqlString, monthname)
	end
end
