class CreateJounalEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :jounal_entries do |t|
      t.date :ymd
      t.integer :pay_amount
      t.references :pay_classification, foreign_key: true
      t.integer :income_amount
      t.references :income_classification, foreign_key: true
      t.references :wallet, foreign_key: true
      t.text :remarks
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
