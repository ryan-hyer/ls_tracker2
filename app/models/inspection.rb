class Inspection < ActiveRecord::Base
	belongs_to :facility
	has_many :tests, dependent: :destroy

	validates :facility, presence: true
	validates :number, uniqueness: true,
					   allow_blank: true
	validates :inspection_date, presence: true

	accepts_nested_attributes_for :tests, allow_destroy: true, reject_if: proc { |attributes| attributes['model'].blank?}

	default_scope { order("inspection_date, number") }	
end
