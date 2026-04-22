class AddAliasToAccounts < ActiveRecord::Migration[8.1]
  def change
    add_column :accounts, :alias, :string
    add_index :accounts, [:entity_id, :alias], unique: true
  end
end
