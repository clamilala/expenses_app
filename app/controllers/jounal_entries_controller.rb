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
    #@jounal_entries = JounalEntry.all.order(created_at: :desc)
    @jounal_entries = JounalEntry.where(user_id: user_id).order(created_at: :desc)
  end
  
  # GET /JounalEntries/1
  # GET /JounalEntries/1.json
  def show
  end
  
  # GET /JounalEntries/new
  def new
    @jounal_entry = JounalEntry.new

    if current_user
      @payclassifications = PayClassification.where(user_id: current_user.id)
    else
      @payclassifications = PayClassification.where(user_id: nil)
    end
    # = PayType.all
    #pay_ymdに初期値（今日の日付）をセット
    @jounal_entry.ymd = Time.now.strftime("%Y-%m-%d")
    @jounal_entry.pay_amount = 0
  end


  # GET /JounalEntries/1/edit
  def edit

    @jounal_entry = JounalEntry.find(params[:id])
    @payclassifications = PayClassification.all
  end
  
  # POST /JounalEntries
  # POST /JounalEntries.json
  def create

    @jounal_entry = JounalEntry.new(jounal_entry_params)
    @jounal_entry.user_id = current_user.id if current_user
    
    if @jounal_entry.save
      redirect_to "/", notice: "登録しました。"
    else
      @payclassifications = PayClassification.all
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
    @jounal_entry = JounalEntry.find(params[:id])
    
    if @jounal_entry.update(jounal_entry_params)
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
    @jounal_entries = JounalEntry.find_by(id: params[:id])
    if @jounal_entries.destroy 
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
    def jounal_entry_params
      #params.require(:jounalEntry).permit(:ymd, :pay_classification_name, :pay_amount, :remarks)
      params.require(:jounal_entry).permit(:ymd, :pay_amount, :remarks)
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
