class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :start_date, :end_date, :address, presence: true
end
