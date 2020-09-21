class Game < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: %w(strategy role-playing adventure quizz word-game classique),
    message: "Not a valid category" }
  validates :condition, presence: true
  validates :condition, inclusion: { in: %w(new good damaged),
    message: "Not a valid category" }
  validates :price_per_day, presence: true
end
