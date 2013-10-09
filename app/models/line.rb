class Line < ActiveRecord::Base
	validates :product_description, presence: true
	validates :unit, presence: true
	validates :unit_value, presence: true
	validates :quantity, presence: true
	validates :vat_value, presence: true
	validates :line_total, presence: true

	belongs_to :invoice
end
