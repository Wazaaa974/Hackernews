class Post < ApplicationRecord
  has_many :comments
  validates :title, presence: true, uniqueness: true
  validates :type, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :score, presence: true, uniqueness: true
  validates :author, presence: true, uniqueness: true
end
