class User < ApplicationRecord

  validates :first_name, presence: true

  has_many :likes
  has_many :categories, through: :likes

  has_many :investments
  has_many :projects, through: :investments

  has_many :projects
end
