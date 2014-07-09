class Invoice < ActiveRecord::Base
	belongs_to :client

	validates :number, presence: true,
					   uniqueness: true
	validates :client, presence: true
	validates :date_invoiced, presence: true

	def self.from_year(year)
		where("EXTRACT(YEAR FROM date_invoiced) = ?", year)
	end
end
