class CreateWallets < ActiveRecord::Migration[5.1]
  def up
    create_table :wallets do |t|
      t.string :name
      t.integer :balance
      t.references :user, foreign_key: true

      t.timestamps
    end

    Wallet.create(name: "いつものお財布", user_id: 1)
  end

  def down
    drop_table(:wallets)
  end
end
