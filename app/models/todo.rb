class Todo < ApplicationRecord
  validates :title, presence: true

  enum :priority, { low: 0, medium: 1, high: 2 }, default: :medium

  scope :completed_list, -> { where(completed: true) }
  scope :active_list, -> { where(completed: false) }
  scope :ordered, -> { order(completed: :asc, priority: :desc, due_date: :asc, created_at: :desc) }

  def overdue?
    due_date.present? && due_date < Date.today && !completed?
  end

  def due_today?
    due_date.present? && due_date == Date.today && !completed?
  end
end
