FactoryBot.define do
    factory :wallet, class: Wallet do
        id {0}
        name {'いつものお財布'}
        balance {0}

        association :user, factory: :users

    end
end