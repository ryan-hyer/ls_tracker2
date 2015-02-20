class Category < ActiveRecord::Base
	validates :description, presence: true,
							uniqueness: true

	def add_standard(standard)
		category_standards.create!(standard.id)
	end

	def remove_standard(standard)
		category_standards.find_by(standard.id).destroy
	end
end
