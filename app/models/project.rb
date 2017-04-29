class Project < ApplicationRecord
  belongs_to :user

  has_many :investments
  has_many :users, through: :investments

  has_many :comments
  has_many :users, through: :comments
end
