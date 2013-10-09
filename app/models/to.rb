class To < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :more_info, presence: true
	
	belongs_to :invoice
end
