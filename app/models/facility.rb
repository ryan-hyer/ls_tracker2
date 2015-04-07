class Facility < ActiveRecord::Base
	belongs_to :client
	has_many :inspections, dependent: :destroy

	validates :client, presence: true
	
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :poc_email, format: { with: VALID_EMAIL_REGEX },
  						  allow_blank: true

  scope :active, -> { where(inactive: false) }
  scope :inactive, -> { where(inactive: true) }

  def inspection_status
  	if self.inspections.empty?
  		inspection_status = "danger"
  	else
  		if self.inspections.first.inspection_date < 12.months.ago
  			inspection_status = "danger"
  		elsif self.inspections.first.inspection_date < 10.months.ago
  			inspection_status = "warning"
  		else
				if self.inspections.first.tests.complete.count == self.inspections.first.tests.count
					inspection_status = "success"
				else
					inspection_status = "warning"
				end
  		end
  	end
  end
end
