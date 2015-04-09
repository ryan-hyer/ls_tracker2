class Amendment < ActiveRecord::Base
	belongs_to :client
	belongs_to :category

	validates :client, presence: true
	validates :project_type, presence: true
	validates :number, uniqueness: true, allow_blank: true

	default_scope -> { order("completed, number") }

	def old_facility
		Facility.find(self.old_facility_id)
	end

	def new_facility
		Facility.find(self.new_facility_id)
	end
end
