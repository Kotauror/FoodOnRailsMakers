class Review < ApplicationRecord
  belongs_to :restaurant
  validates :score, inclusion: { in: [1,2,3,4,5] }
end
