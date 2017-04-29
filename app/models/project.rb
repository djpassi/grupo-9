class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true,
            allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validates :goal, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: true


  belongs_to :user

  has_many :investments
  has_many :users, through: :investments
end
