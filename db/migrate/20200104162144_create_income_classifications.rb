class CreateIncomeClassifications < ActiveRecord::Migration[5.1]
  def up
    create_table :income_classifications do |t|
      t.string :name, unique: true
      t.integer :order_seq
      t.boolean :default_sgn
      t.references :user, foreign_key: true

      t.timestamps
    end

    val = [ [0, "未分類", 1, true, "0"],
            [1, "給与", 2, true, "0"],
            [2, "その他の収入", 3, true, "0"],
          ]

    val.each do |id, name, seq, sgn, user_id|
      IncomeClassification.create(id: id, name: name, order_seq: seq, default_sgn: sgn, user_id: user_id)
    end
    
  end

  def down
    drop_table(:income_classifications)
  end
end
