class CreateImcomeClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :imcome_classifications do |t|
      t.string :name, unique: true
      t.integer :order_seq
      t.boolean :default_sgn
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
