class Gword < ApplicationRecord
  has_many :translations
  has_many :vwords, through: :translations
end
