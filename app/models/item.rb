class Item < ApplicationRecord
	has_many :logs, dependent: :destroy
	has_one :current, -> { where return_date: nil }, class_name: "Log"
	validates :description, presence: true
	belongs_to :academy 
end
