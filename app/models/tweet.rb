class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :fortune
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
