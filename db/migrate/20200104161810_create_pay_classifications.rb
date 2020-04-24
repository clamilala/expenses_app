class CreatePayClassifications < ActiveRecord::Migration[5.1]
  def up
    create_table :pay_classifications do |t|
      t.string :name, unique: true  #名称
      t.integer :order_seq          #ソート順
      t.boolean :default_sgn        #デフォルトサイン（true：「設定」で変更できない）
      t.boolean :list_sgn           #リストサイン（true：「支出の入力」のコンボボックスに表示する）
      t.references :user, foreign_key: true

      t.timestamps
    end

    val = [ [0, "未分類",        1, true,  true],
            [1, "食費",          2, false, true],
            [2, "日用品",        3, false, true],
            [3, "交通",          4, false, true],
            [4, "交際費",        5, false, true],
            [5, "娯楽",          6, false, true],
            [6, "住まい",        7, false, true],
            [7, "医療",          8, false, true],
            [8, "ファッション",  9, false, true],
            [9, "美容",         10, false, true],
            [10, "学習",        11, false, true],
            [11, "保険",        12, false, true],
            [12, "水道・光熱",  13, false, true],
            [13, "通信",        14, false, true],
            [14, "旅行",        15, false, true],
            [999, "-",           0, true,  false],
          ]
    val.each do |id, name, seq, default_sgn, list_sgn|
      PayClassification.create( id: id,
                                name: name, 
                                order_seq: seq, 
                                default_sgn: default_sgn, 
                                list_sgn: list_sgn, 
                                user_id: "0"
                              )
    end
  end

  def down
    drop_table(:pay_classifications)
  end
end
