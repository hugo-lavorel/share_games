class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
  pg_search_scope :search_by_location,
                  against: [:address],
                  using: {
                    tsearch: { prefix: true }
                  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games

  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/,
                              message: "Not a valid email" }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
