class Project < ApplicationRecord
  belongs_to :user

  has_many :investments
  has_many :users, through: :investments
end
