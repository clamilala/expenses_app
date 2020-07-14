FactoryBot.define do
    factory :user, class: User do
        name {'テストユーザー'}
        login_id {'loginid'}
        password {'password'}
    end
end