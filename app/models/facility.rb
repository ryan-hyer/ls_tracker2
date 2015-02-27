class Facility < ActiveRecord::Base
	belongs_to :client
	has_many :inspections, dependent: :destroy

	validates :client, presence: true
	
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :poc_email, format: { with: VALID_EMAIL_REGEX },
  						  allow_blank: true

  scope :active, -> { where(inactive: false) }
  scope :inactive, -> { where(inactive: true) }
end
