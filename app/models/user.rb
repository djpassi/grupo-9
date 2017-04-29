class User < ApplicationRecord

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :password, confirmation:true, presence: true, length: { minimum: 6 }
  validates :email, uniqueness:true, presence: true, allow_blank: false, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}


  has_many :likes
  has_many :categories, through: :likes

  has_many :investments
  has_many :projects, through: :investments

  has_many :projects
end
