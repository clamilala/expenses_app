class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :login_id, null: false
      t.string :password_digest, null: false

      t.timestamps
      
      #
      t.index :login_id, unique: true
    end
  end
end
