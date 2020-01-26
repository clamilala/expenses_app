class SpreadsheetsController < ApplicationController

  def index

    # ユーザーに紐づく収入分類を取得
    @income_classifications = IncomeClassification.where(user_id: current_user.id).order(order_seq: :asc)

    # ユーザーに紐づく支出分類を取得
    @pay_classifications = PayClassification.where(user_id: current_user.id).order(order_seq: :asc)


    income_aggregate = {}
    income_aggregate= (JounalEntry.select("income_classification_id, sum(income_amount) as income_ramount").group("income_classification_id")).to_h
  end
end
