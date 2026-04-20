class Entity < ApplicationRecord
  has_many :cost_centers, dependent: :restrict_with_error
  has_many :accounts, dependent: :restrict_with_error
  has_many :journal_entries, dependent: :restrict_with_error

  enum :entity_type, { PF: "PF", PJ: "PJ" }
  enum :currency, { BRL: "BRL", USD: "USD", EUR: "EUR" }

  validates :name, presence: true
  validates :document, presence: true, uniqueness: true
  validates :entity_type, presence: true
  validates :currency, presence: true
end
