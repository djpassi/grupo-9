class Investment < ApplicationRecord
  validates :amount, presence: true, allow_blank: false, :numericality => { :greater_than => 0}
  validates :user_id, presence: true
  validates :project_id, presence: true


  belongs_to :user
  belongs_to :project
end
