class JounalEntry < ApplicationRecord
  #belongs_to :pay_classification
    belongs_to :pay_classification
    belongs_to :income_classification
    belongs_to :wallet
    belongs_to :user

    
end
