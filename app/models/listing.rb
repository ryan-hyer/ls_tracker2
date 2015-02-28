class Listing < ActiveRecord::Base
	belongs_to :client
	belongs_to :category
	has_many :listing_standards, dependent: :destroy, :inverse_of => :listing
	has_many :standards, through: :listing_standards

	validates :client, presence: true
	validates :category, presence: true

	accepts_nested_attributes_for :listing_standards, allow_destroy: true, reject_if: proc { |attributes| attributes['standard_id'].blank?}

	default_scope -> { includes(:category).order("categories.description") }
end
