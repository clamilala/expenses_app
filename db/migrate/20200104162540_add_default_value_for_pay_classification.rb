class AddDefaultValueForPayClassification < ActiveRecord::Migration[5.1]
  def up
    val = [["未分類", true, 1],
          ["食費", false, 2],
          ["日用品", false, 3],
          ["交通", false, 4],
          ["交際費", false, 5],
          ["娯楽", false, 6],
          ["住まい", false, 7],
          ["医療", false, 8],
          ["ファッション", false, 9],
          ["美容", false, 10],
          ["学習", false, 11],
          ["保険", false, 12],
          ["水道・光熱", false, 13],
          ["通信", false, 14],
          ["旅行", false, 15]
          ]
    val.each do |name, sgn, seq|
      PayClassification.create(name: name, default_sgn: sgn, order_seq: seq)
    end
  end
  
  def down
    execute 'Delete From pay_classifications;'
  end
end
