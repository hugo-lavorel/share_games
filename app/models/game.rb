class Game < ApplicationRecord
  belongs_to :user
  has_many :users, through: :reservations

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

  def self.available_on?(start_date, end_date)
    select { |game| game.available?(start_date, end_date) }
  end

  def available?(start_date, end_date)
    reservations.each do |reservation|
      if (start_date >= reservation.start_date &&
        start_date <= reservation.end_date ||
        end_date >= reservation.start_date && end_date <= reservation.end_date)
        return false
      else
        return true
      end
    end
  end
end
