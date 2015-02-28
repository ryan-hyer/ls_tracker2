class Listing < ActiveRecord::Base
	belongs_to :client
	belongs_to :category
	#has_many :listing_standards, dependent: :destroy

	validates :client, presence: true
	validates :category, presence: true

	default_scope -> { includes(:category).order("categories.description") }
end
