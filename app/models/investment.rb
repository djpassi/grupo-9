class Investment < ApplicationRecord
  validates :amount, presence: true, allow_blank: false, :numericality => { :greater_than => 0}
  validates :user_id, presence: true
  validates :project_id, presence: true


  belongs_to :user
  belongs_to :project

  after_create :update_project_amount
  before_destroy :less_project_amount



   private
     def update_project_amount
       project = Project.find(project_id)
       project[:current] += amount
       project.save
     end
     def less_project_amount
       project = Project.find(project_id)
       project[:current] -= amount
       project.save
     end
end
