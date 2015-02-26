class Category < ActiveRecord::Base
	has_many :category_standards, dependent: :destroy
	has_many :standards, through: :category_standards
	validates :description, presence: true,
							uniqueness: true

	accepts_nested_attributes_for :category_standards, allow_destroy: true, reject_if: proc { |attributes| attributes['standard_id'].blank?}
end
