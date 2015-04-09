class Amendment < ActiveRecord::Base
	belongs_to :client
	belongs_to :category

	validates :client, presence: true
	validates :project_type, presence: true
	validates :number, uniqueness: true, allow_blank: true

	default_scope -> { order("completed, number") }
end
