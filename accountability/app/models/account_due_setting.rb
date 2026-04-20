class AccountDueSetting < ApplicationRecord
  self.primary_key = :account_id
  belongs_to :account

  validates :is_required, inclusion: { in: [true, false] }
end
