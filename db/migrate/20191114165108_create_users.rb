class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string :name, null: false
      t.string :login_id, null: false
      t.string :password_digest, null: false

      t.timestamps
      
      #
      t.index :login_id, unique: true
    end

    User.create(id: 0, name: "テストユーザー", login_id: "user", password: "pass")
  end

  def down
    drop_table(:users)
  end
end
