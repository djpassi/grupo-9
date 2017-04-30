class Investment < ApplicationRecord
  validates :amount, presence: true, allow_blank: false
  validates :user_id, presence: true
  validates :project_id, presence: true

  belongs_to :user
  belongs_to :project
end
