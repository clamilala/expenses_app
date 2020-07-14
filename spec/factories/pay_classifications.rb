FactoryBot.define do
    factory :pay_classification, class: PayClassification do
        #id {0}
        name {'未分類'}
        order_seq {1}
        default_sgn {true}
        list_sgn {true}

        association :user, factory: :users
    end
end