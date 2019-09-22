class HomeController < ApplicationController
  def top
    @payments = Payment.all.order(created_at: :desc)
  end
  
  def create
    @payments = Payment.new(
      pay_ymd: params[:pay_ymd],
      amount: params[:amount]
    )
    
    @payments.save
    redirect_to("/")
    
  end
  
  def destroy
    @payments = Payment.find_by(id: params[:id])
    if @payments.destroy 
      flash[:notice] = "削除に成功しました"
    else
      flash[:notice] = "削除に失敗しました"
    end
    redirect_to("/")
  end
end
