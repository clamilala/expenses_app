require 'rails_helper'

describe '入力の一覧', type: :system do

    #letのブロックが実行されるタイミングは、letが初めて呼び出されたとき
    #let(:user_a) は、user_a が呼び出されたタイミングで実行される
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーＡ', login_id: 'user_a', password: 'password_a') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーＢ', login_id: 'user_b', password: 'password_b') }

    before do

        # 支払分類を作成
        pay_classification_a = FactoryBot.create(:pay_classification, name: '食費', order_seq: 1, default_sgn: true, list_sgn: true, user: user_a)
        # 収入分類を作成
        income_classification_a = FactoryBot.create(:income_classification, user: user_a)
        # 財布／口座を作成
        wallet_a = FactoryBot.create(:wallet, user: user_a)

        # 作成者がユーザーAである仕訳を作成しておく
        FactoryBot.create(  :jounal_entry,
                            pay_amount: 5000,
                            income_amount: 0,
                            remarks: 'ユーザーＡ食費',
                            pay_classification: pay_classification_a,
                            income_classification: income_classification_a,
                            wallet: wallet_a,
                            user: user_a
                        )

        ## login_user でログインする ##
        # ログイン画面にアクセスする
        visit login_path
        # 「ログインID」というラベル（<label>要素）がついたテキストフィールド（<input>要素）
        # に「loginid」を入れる操作
        fill_in 'ログインID', with: login_user.login_id
        # パスワードも同様
        fill_in 'パスワード', with: login_user.password
        # 「ログイン」ボタンを押す
        click_button 'ログイン'
    end

    context 'ユーザーAがログインしているとき' do
        # login_user にuser_aをセット？
        let(:login_user) {user_a}

        it 'ユーザーAが作成した仕訳が表示される' do
            ## 作成済みの仕訳が画面上に表示されていることを確認
            # expect(page).to           ：page(画面)に～することを期待する
            # have_content 'ユーザーＡ食費' ：「ユーザーＡ食費」というコンテンツを持つこと
            # ※have_content の部分はRSpecでは「マッチャ(Matcher)」と呼ぶ
            expect(page).to have_content 'ユーザーＡ食費'
        end

    end

    context 'ユーザーBがログインしているとき' do
        # login_user にuser_bをセット？
        let(:login_user) {user_b}

        it 'ユーザーAが作成した仕訳が表示されない' do
            # ユーザーAが作成した仕訳の備考欄が画面上に表示されていないことを確認

            #expect(page).not_to have_content 'ユーザーＡ食費'　でも可
            expect(page).to have_no_content 'ユーザーＡ食費'
        end
    end

    context '翌月を表示した場合' do
        # login_user にuser_aをセット？
        let(:login_user) {user_a}

        before do
            ## 「表示する月：」というラベル（<label>要素）がついたテキストフィールド（<input>要素）に翌月を入れる
            # 翌月を生成
            next_month = Time.now.next_month.to_s[0...7]
            # セット
            fill_in '表示する月：', with: next_month
            # 「表示」ボタンを押す
            click_button '表示'
        end

        it '今月作成した仕訳が表示されない' do
            # ユーザーAが作成した仕訳の備考欄が画面上に表示されていないことを確認

            #expect(page).not_to have_content 'ユーザーＡ食費'　でも可
            expect(page).to have_no_content 'ユーザーＡ食費'
        end
    end

    context '今月を表示した場合' do
        # login_user にuser_aをセット？
        let(:login_user) {user_a}

        before do
            ## 「表示する月：」というラベル（<label>要素）がついたテキストフィールド（<input>要素）に翌月を入れる
            # 今月を生成
            now_month = Time.now.to_s[0..4] + "年" + Time.now.to_s[6...7] +"月"
            # セット
            fill_in '表示する月：', with: now_month
            # 「表示」ボタンを押す
            click_button '表示'
        end

        it '今月作成した仕訳が表示される' do
            # ユーザーAが作成した仕訳の備考欄が画面上に表示されていないことを確認

            #expect(page).not_to have_content 'ユーザーＡ食費'　でも可
            expect(page).to have_content 'ユーザーＡ食費'
        end
    end
end