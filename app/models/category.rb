class Category < ActiveRecord::Base
	has_many :category_standards
	has_many :standards, through: :category_standards
	validates :description, presence: true,
							uniqueness: true

	def add_standard(standard)
		self.category_standards.create(standard_id: standard.id)
	end

	def remove_standard(standard)
		self.category_standards.find_by(standard_id: standard.id).destroy
	end
end
