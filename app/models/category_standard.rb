class CategoryStandard < ActiveRecord::Base
	belongs_to :category
	belongs_to :standard
end
