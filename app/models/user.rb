class User < ApplicationRecord

  has_many :likes
  has_many :categories, through: :likes

  has_many :investments
  has_many :projects, through: :investments

  has_many :projects
end
