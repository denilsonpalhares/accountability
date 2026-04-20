class JournalEntryRelationship < ApplicationRecord
  belongs_to :journal_entry
  belongs_to :related_entry, class_name: "JournalEntry"

  enum :relationship_type, { REVERSAL: "REVERSAL", RECLASSIFICATION: "RECLASSIFICATION" }

  validates :relationship_type, presence: true
  validates :journal_entry_id, uniqueness: { scope: :related_entry_id }
end
