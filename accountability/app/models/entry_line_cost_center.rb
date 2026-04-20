class EntryLineCostCenter < ApplicationRecord
  belongs_to :entry_line
  belongs_to :cost_center

  validates :value, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :entry_line_id, uniqueness: { scope: :cost_center_id }
end
