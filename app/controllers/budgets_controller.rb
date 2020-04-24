class BudgetsController < ApplicationController

  def index
    
    # ユーザーに紐づく収入分類を取得
    @income_classifications = IncomeClassification.where(user_id: current_user.id, list_sgn: true).order(order_seq: :asc)

    # ユーザーに紐づく支出分類を取得
    @pay_classifications = PayClassification.where(user_id: current_user.id, list_sgn: true).order(order_seq: :asc)

    @active_page = "予算を立てる"
  end

  def new
    @budget = Budget.new
    


    # @jounal_entry = JounalEntry.new

    # if current_user
    #   @pay_classifications = PayClassification.where(user_id: current_user.id)
    #   @wallets = Wallet.where(user_id: current_user.id)
    # else
    #   @pay_classifications = PayClassification.where(user_id: nil)
    #   @wallets = Wallet.where(user_id: nil)
    # end
    # # = PayType.all
    # #pay_ymdに初期値（今日の日付）をセット
    # @jounal_entry.ymd = Time.now.strftime("%Y-%m-%d")
    # @jounal_entry.pay_amount = 0
  end
end
