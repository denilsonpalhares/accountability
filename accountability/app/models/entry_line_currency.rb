class EntryLineCurrency < ApplicationRecord
  belongs_to :entry_line

  enum :currency, { BRL: "BRL", USD: "USD", EUR: "EUR" }

  validates :currency, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
end
