class Inspection < ActiveRecord::Base
	belongs_to :facility

	validates :facility, presence: true
	validates :number, presence: true,
					   uniqueness: true
	validates :inspection_date, presence: true

	default_scope order("inspection_date DESC, number")
end
