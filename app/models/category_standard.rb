class CategoryStandard < ActiveRecord::Base
	belongs_to :category
	belongs_to :standard

	validates :category_id, presence: true
	validates :standard_id, presence: true
end
