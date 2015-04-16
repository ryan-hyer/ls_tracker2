class Amendment < ActiveRecord::Base
	belongs_to :client
	belongs_to :category

	validates :client, presence: true
	validates :project_type, presence: true
	validates :number, uniqueness: true, allow_blank: true
	validates :completed, presence: { if: Proc.new { |amendment| ["Complete","Canceled Before Completion"].include?(amendment.status) },
							  message: "date can't be blank if Project Status is Complete or Canceled" }

	default_scope -> { order("completed, number") }

	def old_facility
		Facility.find(self.old_facility_id)
	end

	def new_facility
		Facility.find(self.new_facility_id)
	end
end
