class AppsettingsController < ApplicationController
  protect_from_forgery 
  before_action :login_required
  skip_before_action :verify_authenticity_token
  def index
    
  end
  
  def pay_type_index
    @paytypes = PayType.where(user_id: current_user.id, default_sgn: false).order(created_at: :asc)
  end
  
  def pay_type_new
    
  end
  
  def pay_type_create
    @paytype = PayType.new(
      pay_type_name: params[:pay_type_name],
      default_sgn: false,
      user_id: current_user.id
    )
    
    @paytype.save
    redirect_to("/appsettings/pay_type_index")
  end
  
  def pay_type_destroy
    @paytype = PayType.find_by(id: params[:id], user_id: current_user.id)
    if @paytype.destroy 
      flash[:notice] = "削除に成功しました"
    else
      flash[:notice] = "削除に失敗しました"
    end
    redirect_to("/appsettings/pay_type_index")
  end
end
