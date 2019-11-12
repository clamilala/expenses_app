class Payment < ApplicationRecord
  #numericality → 数値以外が入っていないかチェック
  validates :amount, numericality: true
  
end
