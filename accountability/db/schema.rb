# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_04_20_025225) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "account_type_enum", ["ASSET", "LIABILITY", "EQUITY", "REVENUE", "EXPENSE"]
  create_enum "currency_enum", ["BRL", "USD", "EUR"]
  create_enum "entity_type_enum", ["PF", "PJ"]
  create_enum "journal_status_enum", ["DRAFT", "POSTED"]
  create_enum "nature_enum", ["DEBIT", "CREDIT"]
  create_enum "relationship_type_enum", ["REVERSAL", "RECLASSIFICATION"]

  create_table "account_cost_center_settings", primary_key: "account_id", id: :uuid, default: nil, force: :cascade do |t|
    t.boolean "is_required", default: false, null: false
    t.index ["account_id"], name: "index_account_cost_center_settings_on_account_id"
  end

  create_table "account_due_settings", primary_key: "account_id", id: :uuid, default: nil, force: :cascade do |t|
    t.boolean "is_required", default: false, null: false
    t.index ["account_id"], name: "index_account_due_settings_on_account_id"
  end

  create_table "account_quantity_settings", primary_key: "account_id", id: :uuid, default: nil, force: :cascade do |t|
    t.integer "decimal_places"
    t.boolean "is_required", default: false, null: false
    t.string "quantity_label"
    t.string "quantity_unit"
    t.index ["account_id"], name: "index_account_quantity_settings_on_account_id"
  end

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.enum "account_type", null: false, enum_type: "account_type_enum"
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.uuid "entity_id", null: false
    t.boolean "is_analytic", null: false
    t.string "name", null: false
    t.enum "nature", null: false, enum_type: "nature_enum"
    t.uuid "parent_id"
    t.datetime "updated_at", null: false
    t.index ["entity_id", "code"], name: "index_accounts_on_entity_id_and_code", unique: true
    t.index ["entity_id"], name: "index_accounts_on_entity_id"
    t.index ["parent_id"], name: "index_accounts_on_parent_id"
  end

  create_table "cost_centers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.string "description"
    t.uuid "entity_id", null: false
    t.date "finished_at"
    t.boolean "is_active", default: true, null: false
    t.string "name", null: false
    t.uuid "parent_id"
    t.date "started_at"
    t.datetime "updated_at", null: false
    t.index ["entity_id", "code"], name: "index_cost_centers_on_entity_id_and_code", unique: true
    t.index ["entity_id"], name: "index_cost_centers_on_entity_id"
    t.index ["parent_id"], name: "index_cost_centers_on_parent_id"
  end

  create_table "entities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.enum "currency", null: false, enum_type: "currency_enum"
    t.string "document", null: false
    t.enum "entity_type", null: false, enum_type: "entity_type_enum"
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["document"], name: "index_entities_on_document", unique: true
  end

  create_table "entry_line_cost_centers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "cost_center_id", null: false
    t.uuid "entry_line_id", null: false
    t.integer "value", null: false
    t.index ["cost_center_id"], name: "index_entry_line_cost_centers_on_cost_center_id"
    t.index ["entry_line_id", "cost_center_id"], name: "idx_entry_line_cost_centers_on_line_and_cc", unique: true
    t.index ["entry_line_id"], name: "index_entry_line_cost_centers_on_entry_line_id"
  end

  create_table "entry_line_currencies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "amount", null: false
    t.enum "currency", null: false, enum_type: "currency_enum"
    t.uuid "entry_line_id", null: false
    t.index ["entry_line_id"], name: "index_entry_line_currencies_on_entry_line_id"
  end

  create_table "entry_line_due_dates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "due_date", null: false
    t.uuid "entry_line_id", null: false
    t.index ["entry_line_id"], name: "index_entry_line_due_dates_on_entry_line_id"
  end

  create_table "entry_line_quantities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "entry_line_id", null: false
    t.decimal "quantity", precision: 18, scale: 6, null: false
    t.string "unit_type", null: false
    t.index ["entry_line_id"], name: "index_entry_line_quantities_on_entry_line_id"
  end

  create_table "entry_lines", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.datetime "created_at", null: false
    t.uuid "journal_entry_id", null: false
    t.enum "nature", null: false, enum_type: "nature_enum"
    t.datetime "updated_at", null: false
    t.integer "value", null: false
    t.index ["account_id"], name: "index_entry_lines_on_account_id"
    t.index ["journal_entry_id"], name: "index_entry_lines_on_journal_entry_id"
  end

  create_table "journal_entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date", null: false
    t.string "description", null: false
    t.uuid "entity_id", null: false
    t.string "reference"
    t.enum "status", null: false, enum_type: "journal_status_enum"
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_journal_entries_on_entity_id"
  end

  create_table "journal_entry_relationships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "journal_entry_id", null: false
    t.uuid "related_entry_id", null: false
    t.enum "relationship_type", null: false, enum_type: "relationship_type_enum"
    t.index ["journal_entry_id", "related_entry_id"], name: "idx_journal_entry_relationships_on_entries", unique: true
    t.index ["journal_entry_id"], name: "index_journal_entry_relationships_on_journal_entry_id"
    t.index ["related_entry_id"], name: "index_journal_entry_relationships_on_related_entry_id"
  end

  add_foreign_key "account_cost_center_settings", "accounts"
  add_foreign_key "account_due_settings", "accounts"
  add_foreign_key "account_quantity_settings", "accounts"
  add_foreign_key "accounts", "accounts", column: "parent_id"
  add_foreign_key "accounts", "entities"
  add_foreign_key "cost_centers", "cost_centers", column: "parent_id"
  add_foreign_key "cost_centers", "entities"
  add_foreign_key "entry_line_cost_centers", "cost_centers"
  add_foreign_key "entry_line_cost_centers", "entry_lines"
  add_foreign_key "entry_line_currencies", "entry_lines"
  add_foreign_key "entry_line_due_dates", "entry_lines"
  add_foreign_key "entry_line_quantities", "entry_lines"
  add_foreign_key "entry_lines", "accounts"
  add_foreign_key "entry_lines", "journal_entries"
  add_foreign_key "journal_entries", "entities"
  add_foreign_key "journal_entry_relationships", "journal_entries"
  add_foreign_key "journal_entry_relationships", "journal_entries", column: "related_entry_id"
end
