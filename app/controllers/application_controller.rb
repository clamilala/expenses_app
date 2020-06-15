class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  #helper_method：全てのビューからメソッドを仕様できるようにする
  helper_method :current_user
  #フィルタ(Filter)機能
  #before_action：アクションの前に特定のメソッドを実行する
  before_action :login_required
  
  
  private
  
  #ログインしているユーザーを取得するメソッド
  def current_user
    #sessionにuser_idがある場合、
    #sessionから取得したuser_idを使用してDBからUserを検索、@current_userにセット
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    
    #自動ログイン用の仮コード
    #user_id = session[:user_id] ? session[:user_id] : 0
    #@current_user ||= User.find_by(id: user_id)
  end
  
  # ログイン済みかチェックするメソッド
  def login_required

    redirect_to login_path unless current_user
  end
end
