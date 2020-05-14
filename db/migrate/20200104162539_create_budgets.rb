class CreateBudgets < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets do |t|
      t.date :ym
      t.references :pay_classification, foreign_key: true
      t.integer :pay_amount
      t.references :income_classification, foreign_key: true
      t.integer :income_amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
