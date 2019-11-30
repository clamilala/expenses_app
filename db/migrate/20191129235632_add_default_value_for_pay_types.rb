class AddDefaultValueForPayTypes < ActiveRecord::Migration[5.1]
  def up
    val = [["未分類", true],
          ["食費", false],
          ["日用品", false],
          ["交通", false],
          ["交際費", false],
          ["娯楽", false],
          ["住まい", false],
          ["医療", false],
          ["ファッション", false],
          ["美容", false],
          ["学習", false],
          ["保険", false],
          ["水道・光熱", false],
          ["通信", false],
          ["旅行", false]
          ]
    val.each do |name, sgn|
      PayType.create(pay_type_name: name, default_sgn: sgn)
    end
  end
  
  def down
    execute 'Delete From pay_types;'
  end
end
