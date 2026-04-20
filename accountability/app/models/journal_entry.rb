class JournalEntry < ApplicationRecord
  belongs_to :entity
  has_many :entry_lines, dependent: :destroy
  has_many :relationships, class_name: "JournalEntryRelationship", dependent: :destroy
  has_many :related_relationships, class_name: "JournalEntryRelationship", foreign_key: "related_entry_id", dependent: :destroy

  enum :status, { DRAFT: "DRAFT", POSTED: "POSTED" }

  validates :date, presence: true
  validates :description, presence: true
  validates :status, presence: true
end
