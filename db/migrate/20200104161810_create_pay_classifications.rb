class CreatePayClassifications < ActiveRecord::Migration[5.1]
  def up
    create_table :pay_classifications do |t|
      t.string :name, unique: true
      t.integer :order_seq
      t.boolean :default_sgn
      t.references :user, foreign_key: true

      t.timestamps
    end

    PayClassification.create(name: "-", user_id: 1)
  end

  def down
    drop_table(:pay_classifications)
  end
end
