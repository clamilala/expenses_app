class Wallet < ApplicationRecord
  belongs_to :user

    
  #クラスメソッド
  def self.create_default_value(user_id)
    val = [["いつものお財布"]
          ]
    val.each do |name|
      Wallet.create(name: name, user_id: user_id)
    end
  end
end
