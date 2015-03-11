class Test < ActiveRecord::Base
	belongs_to :inspection, :inverse_of => :tests
	belongs_to :standard

	validates :number, uniqueness: true, allow_blank: true
end
