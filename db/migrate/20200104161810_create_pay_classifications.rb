class CreatePayClassifications < ActiveRecord::Migration[5.1]
  def up
    create_table :pay_classifications do |t|
      t.string :name, unique: true
      t.integer :order_seq
      t.boolean :default_sgn
      t.references :user, foreign_key: true

      t.timestamps
    end

    val = [ [0, "未分類", true],
            [1, "食費", false],
            [2, "日用品", false],
            [3, "交通", false],
            [4, "交際費", false],
            [5, "娯楽", false],
            [6, "住まい", false],
            [7, "医療", false],
            [8, "ファッション", false],
            [9, "美容", false],
            [10, "学習", false],
            [11, "保険", false],
            [12, "水道・光熱", false],
            [13, "通信", false],
            [14, "旅行", false]
          ]
    val.each do |id, name, sgn|
      PayClassification.create(id: id, name: name, default_sgn: sgn, user_id: "0")
    end
  end

  def down
    drop_table(:pay_classifications)
  end
end
