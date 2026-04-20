class EntryLine < ApplicationRecord
  belongs_to :journal_entry
  belongs_to :account

  has_one :currency_line, class_name: "EntryLineCurrency", dependent: :destroy
  has_many :cost_centers, class_name: "EntryLineCostCenter", dependent: :destroy
  has_one :quantity_line, class_name: "EntryLineQuantity", dependent: :destroy
  has_one :due_date_line, class_name: "EntryLineDueDate", dependent: :destroy

  enum :nature, { DEBIT: "DEBIT", CREDIT: "CREDIT" }

  validates :value, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :nature, presence: true
end
