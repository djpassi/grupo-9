class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true,
            allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validates :goal, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: true


  belongs_to :user

  has_many :comments, dependent: :delete_all
  has_many :projects, through: :comments, dependent: :delete_all

  has_many :investments,  dependent: :delete_all
  has_many :users, through: :investments, dependent: :delete_all

end
