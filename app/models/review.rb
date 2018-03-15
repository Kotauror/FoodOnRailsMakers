class Review < ApplicationRecord
  belongs_to :restaurant
  validates :score, presence: true
end
