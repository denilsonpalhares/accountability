class EntryLineQuantity < ApplicationRecord
  belongs_to :entry_line

  validates :quantity, presence: true, numericality: true
  validates :unit_type, presence: true
end
