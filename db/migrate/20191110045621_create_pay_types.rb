class CreatePayTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_types do |t|
      t.string :pay_type_name, null: false, unique: true
      t.timestamps
    end
  end
end
