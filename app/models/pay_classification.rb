class PayClassification < ApplicationRecord
  belongs_to :user

  #クラスメソッド
  def self.create_default_value(user_id)
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
      PayClassification.create(name: name, default_sgn: sgn, user_id: user_id)
    end
  end
end
