class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.string :name
      t.integer :balance
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
