class Category < ActiveRecord::Base
	has_many :category_standards, dependent: :destroy, :inverse_of => :category
	has_many :standards, through: :category_standards
	belongs_to :scheme

	validates :description, presence: true,
							uniqueness: { :scope => :scheme_id }
	validates :scheme, presence: true

	accepts_nested_attributes_for :category_standards, allow_destroy: true, reject_if: proc { |attributes| attributes['standard_id'].blank?}
end
