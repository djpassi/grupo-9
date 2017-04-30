class User < ApplicationRecord

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :password, confirmation:true, presence: true, length: { minimum: 6 }
  validates :email, uniqueness:true, presence: true, allow_blank: false, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}


  has_many :likes, dependent: :delete_all
  has_many :categories, through: :likes, dependent: :delete_all

  has_many :investments, dependent: :delete_all
  has_many :projects, through: :investments, dependent: :delete_all

  has_many :projects,  dependent: :delete_all

  has_many :comments, dependent: :delete_all
  has_many :users, through: :comments, dependent: :delete_all

end
