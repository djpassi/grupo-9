class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true,
            allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validates :goal, presence: true, allow_blank: false, numericality: { :greater_than => 0 }
  validates :description, presence: true, allow_blank: true


  belongs_to :user

  has_many :comments, dependent: :delete_all
  has_many :projects, through: :comments, dependent: :delete_all

  has_many :investments, dependent: :delete_all
  has_many :users, through: :investments, dependent: :delete_all

  before_destroy :destroy_associations


   private

   private
     def destroy_associations
       Comment.where(project_id: id).destroy_all
     end

end
