class Test < ActiveRecord::Base
	belongs_to :inspection, :inverse_of => :tests
	belongs_to :standard

	validates :number, uniqueness: true, allow_blank: true

	def not_received?
		sample_received.blank?
	end

	def not_tested?
		number.blank?
	end
end
