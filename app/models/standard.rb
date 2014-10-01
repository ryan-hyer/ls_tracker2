class Standard < ActiveRecord::Base
	has_many :category_standards, dependent: :destroy
	has_many :categories, through: :category_standards

	validates :number, presence: true,
					   uniqueness: true
end
