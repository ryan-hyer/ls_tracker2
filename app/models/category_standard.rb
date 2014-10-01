class CategoryStandard < ActiveRecord::Base
	belongs_to :categories
	belongs_to :standards

	validates :category_id, presence: true
	validates :standard_id, presence: true
end
