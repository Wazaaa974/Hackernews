class Comment < ApplicationRecord
  has_many :reactions
  belongs_to :user
  belongs_to :post
  validates :content, presence: true
end
