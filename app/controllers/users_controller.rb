class UsersController < ApplicationController
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
  
  

end
