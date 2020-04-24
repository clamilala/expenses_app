class CreateIncomeClassifications < ActiveRecord::Migration[5.1]
  def up
    create_table :income_classifications do |t|
      t.string :name, unique: true  #名称
      t.integer :order_seq          #ソート順
      t.boolean :default_sgn        #デフォルトサイン（true：「設定」で変更できない）
      t.boolean :list_sgn           #リストサイン（true：「支出の入力」のコンボボックスに表示する）
      t.references :user, foreign_key: true

      t.timestamps
    end

    val = [ [0,   "未分類",       1, true,  true],
            [1,   "給与",         2, false, true],
            [2,   "その他の収入", 3, false, true],
            [999, "-",            0, true,  false]
          ]

    val.each do |id, name, seq, default_sgn, list_sgn |
      IncomeClassification.create(id: id,
                                  name: name, 
                                  order_seq: seq, 
                                  default_sgn: default_sgn, 
                                  list_sgn: list_sgn, 
                                  user_id: "0"
                                  )
    end
    
  end

  def down
    drop_table(:income_classifications)
  end
end
