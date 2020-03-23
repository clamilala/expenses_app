class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @user = User.new
  end

  def create
    
    @user = User.new(
      name: params[:name],
      login_id: params[:login_id],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    
    if @user.save
      
      #支払分類のデフォルト値を作成
      Pay_classification.create_default_value(@user.id)

      #todo:収入分類のデフォルト値を作成
      
      #財布／口座のデフォルト値を作成
      Wallet.create_default_value(@user.id)

      redirect_to("/", notice: "ユーザー「#{@user.name}」を登録しました。")
    else
      render(:new)
    end
    
    #仮コード
    #redirect_to("/appsettings")
  end

    
  def edit
  end

  def show
  end
  
  def destroy
    #ユーザーに紐づく支払分類を削除
    PayType.where(user_id: current_user.id).destroy_all
    #ユーザーを削除
    current_user.destroy
    #セッションのユーザー情報を削除
    session.delete(:user_id)
    
    redirect_to "/", notice: 'ユーザーを削除しました'
  end

end
