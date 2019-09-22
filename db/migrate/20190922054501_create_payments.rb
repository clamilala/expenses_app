class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.date :pay_ymd
      t.string :classification_id
      t.integer :amount
      t.text :remarks

      t.timestamps
    end
  end
end
