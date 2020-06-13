class SessionsController < ApplicationController
  #skip_before_action：親クラス等で定義済みのフィルタを通らないようにする
  skip_before_action :verify_authenticity_token
  skip_before_action :login_required

  def new
    
  end
  
  def create
    user = User.find_by(login_id: session_params[:login_id])
    
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to "/", notice: 'ログインしました'
    else
      flash[:notice] = 'ログインに失敗しました'
      render :new, notice: 'ログインに失敗しました'
    end
  end
  
  def destroy
    #セッション内の情報を全て削除する
    #reset_session
    #session[:user_id] = nil
    session.delete(:user_id)
#    flash[:notice] = 'ログインに失敗しました'
#    redirect_to "/"
    redirect_to "/", notice: 'ログアウトしました'
  end
  
  private 
    def session_params
      params.require(:session).permit(:login_id, :password)
    end
end
