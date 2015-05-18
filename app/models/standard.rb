class Standard < ActiveRecord::Base
	has_many :category_standards, dependent: :destroy
	has_many :categories, through: :category_standards
	has_many :listing_standards, dependent: :destroy
	has_many :listings, through: :listing_standards

	validates :number, presence: true,
							uniqueness: { scope: :exceptions,
														message: "/ limitations combination has been taken" }

	default_scope { order("number, revision, exceptions") }

	def number_with_exceptions
		nwe = "#{number}"
		nwe += " (#{exceptions})" if exceptions.present?
		nwe
	end
end