class BudgetsController < ApplicationController

  def index
    
    # ユーザーに紐づく収入分類を取得
    @income_classifications = IncomeClassification.where(user_id: current_user.id, list_sgn: true).order(order_seq: :asc)

    # ユーザーに紐づく支出分類を取得
    @pay_classifications = PayClassification.where(user_id: current_user.id, list_sgn: true).order(order_seq: :asc)

    @active_page = "予算を立てる"
  end

  # GET /Budgets/new
  def new
    @budget = Budget.new
    
    # ユーザーに紐づく収入分類を取得
    @income_classifications = IncomeClassification.where(user_id: current_user.id, list_sgn: true).order(order_seq: :asc)

    # ユーザーに紐づく支出分類を取得
    @pay_classifications = PayClassification.where(user_id: current_user.id, list_sgn: true).order(order_seq: :asc)


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

  # POST /Budgets
  # POST /Budgets.json
  def create

    pay_amount[] = params[:budget].pay_amount
    @pay_classifications.each do |id|

      Budget.new( ym:                 params[:budget].ymd,
                  pay_classification: id,
                  pay_amount:         pay_amount[id],

                  )

create_table :budgets do |t|
  t.date :ym
  t.references :pay_classification, foreign_key: true
  t.integer :pay_amount
  t.references :income_classification, foreign_key: true
  t.integer :income_amount
  t.references :user, foreign_key: true

  t.timestamps
end

    end

    @Budget = Budget.new(budget_params)
    @Budget.user_id = current_user.id if current_user
    
    if @JounalEntry.save
      redirect_to "/", notice: "登録しました。"
    else
      @paytypes = PayType.all
      render :new
    end
    
  end

  private
  def budget_params(id)
    #params.require(:jounalEntry).permit(:ymd, :pay_classification_name, :pay_amount, :remarks)
    params.require(:budget).permit( :ymd,
                                    :pay_amount,
                                    :income_amount,
                                  )
  end

  def set_active_page
    @active_page = "予算を立てる"
  end

end
