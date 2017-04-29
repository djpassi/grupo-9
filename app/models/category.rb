class Category < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes

  has_many :associates
  has_many :projects, through: :associates
end
