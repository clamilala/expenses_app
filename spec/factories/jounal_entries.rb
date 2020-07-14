FactoryBot.define do
    factory :jounal_entry, class: JounalEntry do
        ymd {Time.now}
        pay_amount {0}
        income_amount {0}
        remarks {'備考欄'}
        

        # :jounal_entryファクトリを使用してJounal_entryオブジェクトを生成する際に
        # 同時に:userファクトリで生成されたUserオブジェクトがuser関連に入った状態になる
        # association :user,                  factory: :users
        # association :pay_classification,    factory: :pay_classifications
        # association :income_classification, factory: :income_classifications
        # association :wallet,                factory: :wallets
        user
        pay_classification
        income_classification
        wallet
    end
end