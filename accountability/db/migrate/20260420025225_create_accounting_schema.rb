class CreateAccountingSchema < ActiveRecord::Migration[8.1]
  def change
    enable_extension "pgcrypto"

    create_enum :entity_type_enum, ["PF", "PJ"]
    create_enum :account_type_enum, ["ASSET", "LIABILITY", "EQUITY", "REVENUE", "EXPENSE"]
    create_enum :nature_enum, ["DEBIT", "CREDIT"]
    create_enum :journal_status_enum, ["DRAFT", "POSTED"]
    create_enum :relationship_type_enum, ["REVERSAL", "RECLASSIFICATION"]
    create_enum :currency_enum, ["BRL", "USD", "EUR"]

    create_table :entities, id: :uuid do |t|
      t.string :name, null: false
      t.string :document, null: false
      t.enum :entity_type, enum_type: "entity_type_enum", null: false
      t.enum :currency, enum_type: "currency_enum", null: false

      t.timestamps
    end
    add_index :entities, :document, unique: true

    create_table :cost_centers, id: :uuid do |t|
      t.references :entity, type: :uuid, null: false, foreign_key: true
      t.references :parent, type: :uuid, foreign_key: { to_table: :cost_centers }
      t.string :code, null: false
      t.string :name, null: false
      t.string :description
      t.boolean :is_active, null: false, default: true
      t.date :started_at
      t.date :finished_at

      t.timestamps
    end
    add_index :cost_centers, [:entity_id, :code], unique: true

    create_table :accounts, id: :uuid do |t|
      t.references :entity, type: :uuid, null: false, foreign_key: true
      t.references :parent, type: :uuid, foreign_key: { to_table: :accounts }
      t.string :code, null: false
      t.string :name, null: false
      t.enum :account_type, enum_type: "account_type_enum", null: false
      t.enum :nature, enum_type: "nature_enum", null: false
      t.boolean :is_analytic, null: false

      t.timestamps
    end
    add_index :accounts, [:entity_id, :code], unique: true

    create_table :account_quantity_settings, id: false do |t|
      t.references :account, type: :uuid, null: false, primary_key: true, foreign_key: true
      t.boolean :is_required, null: false, default: false
      t.string :quantity_label
      t.string :quantity_unit
      t.integer :decimal_places
    end

    create_table :account_due_settings, id: false do |t|
      t.references :account, type: :uuid, null: false, primary_key: true, foreign_key: true
      t.boolean :is_required, null: false, default: false
    end

    create_table :account_cost_center_settings, id: false do |t|
      t.references :account, type: :uuid, null: false, primary_key: true, foreign_key: true
      t.boolean :is_required, null: false, default: false
    end

    create_table :journal_entries, id: :uuid do |t|
      t.references :entity, type: :uuid, null: false, foreign_key: true
      t.date :date, null: false
      t.string :description, null: false
      t.string :reference
      t.enum :status, enum_type: "journal_status_enum", null: false

      t.timestamps
    end

    create_table :journal_entry_relationships, id: :uuid do |t|
      t.references :journal_entry, type: :uuid, null: false, foreign_key: true
      t.references :related_entry, type: :uuid, null: false, foreign_key: { to_table: :journal_entries }
      t.enum :relationship_type, enum_type: "relationship_type_enum", null: false
    end
    add_index :journal_entry_relationships, [:journal_entry_id, :related_entry_id], unique: true, name: 'idx_journal_entry_relationships_on_entries'

    create_table :entry_lines, id: :uuid do |t|
      t.references :journal_entry, type: :uuid, null: false, foreign_key: true
      t.references :account, type: :uuid, null: false, foreign_key: true
      t.integer :value, null: false
      t.enum :nature, enum_type: "nature_enum", null: false

      t.timestamps
    end

    create_table :entry_line_currencies, id: :uuid do |t|
      t.references :entry_line, type: :uuid, null: false, foreign_key: true
      t.enum :currency, enum_type: "currency_enum", null: false
      t.integer :amount, null: false
    end

    create_table :entry_line_cost_centers, id: :uuid do |t|
      t.references :entry_line, type: :uuid, null: false, foreign_key: true
      t.references :cost_center, type: :uuid, null: false, foreign_key: true
      t.integer :value, null: false
    end
    add_index :entry_line_cost_centers, [:entry_line_id, :cost_center_id], unique: true, name: 'idx_entry_line_cost_centers_on_line_and_cc'

    create_table :entry_line_quantities, id: :uuid do |t|
      t.references :entry_line, type: :uuid, null: false, foreign_key: true
      t.decimal :quantity, precision: 18, scale: 6, null: false
      t.string :unit_type, null: false
    end

    create_table :entry_line_due_dates, id: :uuid do |t|
      t.references :entry_line, type: :uuid, null: false, foreign_key: true
      t.date :due_date, null: false
    end
  end
end
