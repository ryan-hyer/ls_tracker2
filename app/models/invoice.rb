class Invoice < ActiveRecord::Base
	belongs_to :client

	validates :number, presence: true,
					   uniqueness: true
	validates :client, presence: true
	validates :date_invoiced, presence: true
end
