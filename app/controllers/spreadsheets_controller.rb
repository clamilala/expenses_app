class SpreadsheetsController < ApplicationController

  def index
    # ユーザーに紐づく収入分類を取得
    @income_classifications = IncomeClassification.where(user_id: current_user.id, list_sgn: true).order(order_seq: :asc)

    # ユーザーに紐づく支出分類を取得
    @pay_classifications = PayClassification.where(user_id: current_user.id, list_sgn: true).order(order_seq: :asc)

    # 条件 ? 結果1 : 結果2
    # ↓
    # if 条件
    #   結果1
    # else
    #   結果2
    # end

    # if 画面で集計月が選択されている then 画面.集計月 else 現在時刻の「yyyy-mm」
    @target_month = params[:target_month] ? params[:target_month] : (Time.new).to_s.slice(0, 7)
    # "-" で分割して変数にセット
    @year, @month  =  @target_month.split("-")
    # 選択した年月の1日を生成（Timeクラス？）
    t = Time.new(@year, @month, 1)
  
    # t.t.beginning_of_month ：月初
    # t.end_of_month         ：月末

    # ハッシュ宣言（aggregate：集計）
    @income_aggregate = {}
    # 収入の合計額を取得してハッシュに変換
    @income_aggregate = JounalEntry.where(user_id: current_user.id, ymd: (t.beginning_of_month)..(t.end_of_month)).group(:income_classification_id).sum(:income_amount).to_h
    ## SELECT SUM(income_amount)
    ## FROM JounalEntry
    ## WHERE ymd BETWEEN t.beginning_of_month AND t.end_of_month
    ## GROUP BY income_classification_id
    
    # ハッシュ宣言（aggregate：集計）
    @pay_aggregate = {}
    # 支出の合計額を取得てハッシュに変換
    @pay_aggregate = JounalEntry.where(user_id: current_user.id, ymd: (t.beginning_of_month)..(t.end_of_month)).group(:pay_classification_id).sum(:pay_amount).to_h
    
    @active_page = "集計表"
  end
end
