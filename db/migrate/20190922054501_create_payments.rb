class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.date :pay_ymd, null: false
      t.string :pay_type_name, null: false
      t.integer :amount, null: false
      t.text :remarks

      t.timestamps
    end
  end
end
