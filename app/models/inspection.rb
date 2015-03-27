class Inspection < ActiveRecord::Base
	belongs_to :facility
	has_many :tests, dependent: :destroy

	validates :facility, presence: true
	validates :number, presence: true,
					   uniqueness: true
	validates :inspection_date, presence: true

	accepts_nested_attributes_for :tests, allow_destroy: true, reject_if: proc { |attributes| attributes['model'].blank?}

	default_scope { order("inspection_date DESC, number") }

	def this_year?
		inspection_date.year == Time.now.year
		# could possibly change this to "last 12 months" instead
	end

end
