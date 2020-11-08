class Game < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings

  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: %w[strategy role-playing adventure quizz word-game classique],
                                    message: "Not a valid category" }
  validates :condition, presence: true
  validates :condition, inclusion: {  in: %w[new good damaged],
                                      message: "Not a valid category" }
  validates :price_per_day, presence: true
  validates :player_min, presence: true
  validates :player_max, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: [:name],
                  using: {
                    tsearch: { prefix: true }
                  }
  # pg_search_scope :search_by_location,
                  # against: [:user.address],
                  # using: {
                    # tsearch: { prefix: true }
                  # }
end
