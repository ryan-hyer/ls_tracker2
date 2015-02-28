class ListingStandard < ActiveRecord::Base
	belongs_to :listing, :inverse_of => :listing_standards
	belongs_to :standard

	validates :listing, presence: true
	validates :standard, presence: true
end
