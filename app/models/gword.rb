class Gword < ApplicationRecord
  has_many :translations
  has_many :vwords, through: :translations
  has_many :comments

  validates :entry, presence: true
end
