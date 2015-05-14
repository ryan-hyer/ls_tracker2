class Test < ActiveRecord::Base
	belongs_to :inspection, :inverse_of => :tests

	validates :number, uniqueness: true, allow_blank: true

	def not_received?
		sample_received.blank?
	end

	def not_tested?
		number.blank?
	end

	scope :complete, -> { where("number <> ''") }
end
