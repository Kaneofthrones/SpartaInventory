class Item < ApplicationRecord

	has_many :logs
	has_one :current, -> { where return_date: nil }, class_name: "Log"
	validates :description, presence: true

end
