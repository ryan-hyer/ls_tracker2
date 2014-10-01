class Facility < ActiveRecord::Base
	belongs_to :client

	validates :client, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :poc_email, format: { with: VALID_EMAIL_REGEX },
  						  allow_blank: true

  	def self.active
  		where("inactive = ?", false)
  	end

  	def self.inactive
  		where("inactive = ?", true)
  	end
end
