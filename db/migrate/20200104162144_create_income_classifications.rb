class CreateIncomeClassifications < ActiveRecord::Migration[5.1]
  def up
    create_table :income_classifications do |t|
      t.string :name, unique: true
      t.integer :order_seq
      t.boolean :default_sgn
      t.references :user, foreign_key: true

      t.timestamps
    end

    IncomeClassification.create(name: "-", user_id: 1)
  end

  def down
    drop_table(:income_classifications)
  end
end
