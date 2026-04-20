class CostCenter < ApplicationRecord
  belongs_to :entity
  belongs_to :parent, class_name: "CostCenter", optional: true
  has_many :children, class_name: "CostCenter", foreign_key: "parent_id", dependent: :restrict_with_error
  has_many :entry_line_cost_centers, dependent: :restrict_with_error

  validates :code, presence: true, uniqueness: { scope: :entity_id }
  validates :name, presence: true
  validates :is_active, inclusion: { in: [true, false] }
end
