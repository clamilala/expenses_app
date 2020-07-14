FactoryBot.define do
    factory :income_classification, class: IncomeClassification do
        #id {0}
        name {'未分類'}
        order_seq {1}
        default_sgn {true}
        list_sgn {true}

        association :user, factory: :users
    end
end