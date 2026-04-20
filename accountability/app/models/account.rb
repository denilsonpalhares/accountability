class Account < ApplicationRecord
  belongs_to :entity
  belongs_to :parent, class_name: "Account", optional: true
  has_many :children, class_name: "Account", foreign_key: "parent_id", dependent: :restrict_with_error

  has_one :quantity_setting, class_name: "AccountQuantitySetting", dependent: :destroy
  has_one :due_setting, class_name: "AccountDueSetting", dependent: :destroy
  has_one :cost_center_setting, class_name: "AccountCostCenterSetting", dependent: :destroy

  has_many :entry_lines, dependent: :restrict_with_error

  enum :account_type, { 
    ASSET: "ASSET", 
    LIABILITY: "LIABILITY", 
    EQUITY: "EQUITY", 
    REVENUE: "REVENUE", 
    EXPENSE: "EXPENSE" 
  }
  enum :nature, { DEBIT: "DEBIT", CREDIT: "CREDIT" }

  validates :code, presence: true, uniqueness: { scope: :entity_id }
  validates :name, presence: true
  validates :account_type, presence: true
  validates :nature, presence: true
  validates :is_analytic, inclusion: { in: [true, false] }
end
