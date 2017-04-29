class User < ApplicationRecord

  has_many :likes
  has_many :categories, through: :likes
end
