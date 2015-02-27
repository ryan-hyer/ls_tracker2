class CategoryStandard < ActiveRecord::Base
	belongs_to :category, :inverse_of => :category_standards
	belongs_to :standard

	validates :category, presence: true
	validates :standard, presence: true
end
