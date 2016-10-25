class Vword < ApplicationRecord
  has_many :translations
  has_many :gwords, through: :translations
end
