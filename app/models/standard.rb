class Standard < ActiveRecord::Base
	has_many :category_standards, dependent: :destroy
	has_many :categories, through: :category_standards

	validates :number, presence: true

	def number_with_exceptions
		nwe = "#{number}-#{revision}"
		nwe += " (#{exceptions})" if exceptions.present?
		nwe
	end
end
