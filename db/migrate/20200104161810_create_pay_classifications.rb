class CreatePayClassifications < ActiveRecord::Migration[5.1]
  def up
    create_table :pay_classifications do |t|
      t.string :name, unique: true
      t.integer :order_seq
      t.boolean :default_sgn
      t.references :user, foreign_key: true

      t.timestamps
    end

    val = [ [0, "未分類", 1, true],
            [1, "食費", 2, false],
            [2, "日用品", 3, false],
            [3, "交通", 4, false],
            [4, "交際費", 5, false],
            [5, "娯楽", 6, false],
            [6, "住まい", 7, false],
            [7, "医療", 8, false],
            [8, "ファッション", 9, false],
            [9, "美容", 10, false],
            [10, "学習", 11, false],
            [11, "保険", 12, false],
            [12, "水道・光熱", 13, false],
            [13, "通信", 14, false],
            [14, "旅行", 15, false]
          ]
    val.each do |id, name, seq, sgn|
      PayClassification.create(id: id, name: name, default_sgn: sgn, order_seq: seq, user_id: "0")
    end
  end

  def down
    drop_table(:pay_classifications)
  end
end
