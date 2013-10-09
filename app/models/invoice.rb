class Invoice < ActiveRecord::Base
	has_one :from, autosave: true, :dependent => :destroy
	has_one :to, autosave: true, :dependent => :destroy
	has_many :lines, autosave: true, :dependent => :destroy

	has_attached_file :image

	validates :number, presence: true
	validates :date_issued, presence: true
	validates :payment_due, presence: true
	validates :description, presence: true
	validates :payment_description, presence: true

	accepts_nested_attributes_for :lines, :allow_destroy => true
	accepts_nested_attributes_for :from
	accepts_nested_attributes_for :to

end
