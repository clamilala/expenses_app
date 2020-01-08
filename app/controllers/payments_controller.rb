class JounalEntriesController < ApplicationController
  protect_from_forgery 
  #before_action :set_user, only: [:show, :edit, :update, :destroy]  
  
  # GET /JounalEntries
  # GET /JounalEntries.json
  def index
    if current_user
      user_id = current_user.id
    else
      user_id = nil
    end
#    @JounalEntries = JounalEntry.all.order(created_at: :desc)
    @JounalEntries = JounalEntry.where(user_id: user_id).order(created_at: :desc)
  end
  
  # GET /JounalEntries/1
  # GET /JounalEntries/1.json
  def show
  end
  
  # GET /JounalEntries/new
  def new
    @JounalEntry = JounalEntry.new
    
    if current_user
      @paytypes = PayType.where(user_id: current_user.id)
    else
      @paytypes = PayType.where(user_id: nil)
    end
    # = PayType.all
    #pay_ymdに初期値（今日の日付）をセット
    @JounalEntry.pay_ymd = Time.now.strftime("%Y-%m-%d")
    @JounalEntry.amount = 0
  end
  
  
  # GET /JounalEntries/1/edit
  def edit
    @JounalEntry = JounalEntry.find(params[:id])
    @paytypes = PayType.all
  end
  
  # POST /JounalEntries
  # POST /JounalEntries.json
  def create

    @JounalEntry = JounalEntry.new(JounalEntry_params)
    @JounalEntry.user_id = current_user.id if current_user
    
    if @JounalEntry.save
      redirect_to "/", notice: "登録しました。"
    else
      @paytypes = PayType.all
      render :new
    end
    
  end
  

#  def create
#    @user = User.new(user_params)
#
#    respond_to do |format|
#      if @user.save
#        format.html { redirect_to @user, notice: 'User was successfully created.' }
#        format.json { render :show, status: :created, location: @user }
#      else
#        format.html { render :new }
#        format.json { render json: @user.errors, status: :unprocessable_entity }
#      end
#    end
#  end
  
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @JounalEntry = JounalEntry.find(params[:id])
    
    if @JounalEntry.update(JounalEntry_params)
#      format.html { redirect_to @user, notice: 'User was successfully updated.' }
#      format.json { render :show, status: :ok, location: @user }
      flash[:notice] = "更新に成功しました"
      redirect_to("/")
    else
#      format.html { render :edit }
#      format.json { render json: @user.errors, status: :unprocessable_entity }
      flash[:notice] = "更新に失敗しました"
      render 'edit'
    end

  end
  
  def destroy
    @JounalEntries = JounalEntry.find_by(id: params[:id])
    if @JounalEntries.destroy 
      flash[:notice] = "削除に成功しました"
    else
      flash[:notice] = "削除に失敗しました"
    end
    redirect_to("/")
  end
  
#  # DELETE /users/1
#  # DELETE /users/1.json
#  def destroy
#    @user.destroy
#    respond_to do |format|
#      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
#      format.json { head :no_content }
#    end
#  end
#  

  private
    def JounalEntry_params
      params.require(:JounalEntry).permit(:pay_ymd, :pay_type_name, :amount, :remarks)
    end
#    # Use callbacks to share common setup or constraints between actions.
#    def set_user
#      @user = User.find(params[:id])
#    end
#
#    # Never trust parameters from the scary internet, only allow the white list through.
#    def user_params
#      params.require(:user).permit(:name, :address, :age)
#    end


end
