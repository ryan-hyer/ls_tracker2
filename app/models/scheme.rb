class Scheme < ActiveRecord::Base
	has_many :categories

	validates :name, presence: true,
					 uniqueness: true

	default_scope { order("name") }
end
