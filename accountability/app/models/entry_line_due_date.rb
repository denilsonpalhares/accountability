class EntryLineDueDate < ApplicationRecord
  belongs_to :entry_line

  validates :due_date, presence: true
end
