class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 15, maximum: 100 }
  validates :description, presence: true, length: { minimum: 15, maximum: 300 }
  validates :user_id, presence: true
end