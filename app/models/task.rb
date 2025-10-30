class Task < ApplicationRecord
  belongs_to :list
  has_and_belongs_to_many :notes

  validates :title, presence: true
  enum :status, {
    pending: "pending",
    in_progress: "in_progress",
    completed: "completed",
    cancelled: "cancelled"
  }
end
