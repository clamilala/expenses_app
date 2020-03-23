class SpreadsheetsController < ApplicationController

  def index

    # ユーザーに紐づく収入分類を取得
    @income_classifications = IncomeClassification.where(user_id: current_user.id).order(order_seq: :asc)

    # ユーザーに紐づく支出分類を取得
    @pay_classifications = PayClassification.where(user_id: current_user.id).order(order_seq: :asc)

    
    # ハッシュ宣言
    @income_aggregate = {}
    # 収入の合計額を取得するしてハッシュに変換
    @income_aggregate = JounalEntry.group(:income_classification_id).sum(:income_amount).to_h
    
    # ハッシュ宣言
    @pay_aggregate = {}
    # 支出の合計額を取得するてハッシュに変換
    @pay_aggregate = JounalEntry.group(:pay_classification_id).sum(:pay_amount).to_h
    
    @active_page = "集計表"
  end
end
