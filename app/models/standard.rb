class Standard < ActiveRecord::Base
	has_many :category_standards
	has_many :categories, through: :category_standards

	validates :number, presence: true
end
