class Log < ApplicationRecord
  
  belongs_to :item
  validates :title, presence: true

  attr_accessor :borrower, :lender , :returned_to
  
end