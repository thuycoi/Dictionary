class Comment < ApplicationRecord
  belongs_to :gword

  validates :commenter, presence: true
  validates :body, presence: true
end
