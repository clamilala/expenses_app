class PaymentsController < ApplicationController
  protect_from_forgery 
  #before_action :set_user, only: [:show, :edit, :update, :destroy]  
  
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all.order(created_at: :desc)
  end
  
  # GET /payments/1
  # GET /payments/1.json
  def show
  end
  
  # GET /payments/new
  def new
    @payments = Payment.new
    @paytypes = PayType.all
  end
  
  
  # GET /payments/1/edit
  def edit
  end
  
  # POST /payments
  # POST /payments.json
  def create
    
    
    @payments = Payment.new(
      pay_ymd: params[:pay_ymd],
      pay_type_name: params[:pay_type_name],
      amount: params[:amount],
      remarks: params[:remarks]
    )
    
    if @payments.save
      redirect_to @payments, notice: "登録しました。"
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
  
#  # PATCH/PUT /users/1
#  # PATCH/PUT /users/1.json
#  def update
#    respond_to do |format|
#      if @user.update(user_params)
#        format.html { redirect_to @user, notice: 'User was successfully updated.' }
#        format.json { render :show, status: :ok, location: @user }
#      else
#        format.html { render :edit }
#        format.json { render json: @user.errors, status: :unprocessable_entity }
#      end
#    end
#  end
  
  def destroy
    @payments = Payment.find_by(id: params[:id])
    if @payments.destroy 
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

#  private
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
