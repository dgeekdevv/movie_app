class Movie < ApplicationRecord
  validates :year, presence: true,
                   format: { with: /(19|20)\d{2}/i }
  validates :name, presence: true
  validates :genres, presence: true
  enum genres: %w[Action Adventure Animation Biography Comedy Crime
                  Documentary Drama Fantasy History Horror
                  Musical Mystery Romance Sci-Fi Thriller War Western]

  validates_length_of :name, maximum: 80
  validates_length_of :director, maximum: 60, allow_blank: true
  validates_length_of :main_star, maximum: 60, allow_blank: true
  validates_length_of :description, maximum: 400, allow_blank: true

  has_many :likes
  has_many :users, through: :likes
end
