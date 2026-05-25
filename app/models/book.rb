class Book < ApplicationRecord
  include PgSearch::Model
pg_search_scope :search_by_title_and_author,
  against: [ :title, :author ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :category, presence: true
  validates :year, presence: true
  validates :price, presence: true
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_one_attached :photo

end
