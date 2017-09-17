class MyAccountsController < ApplicationController
  before_action :set_my_account, only: [:show, :update, :destroy]

  # GET /my_accounts
  def index
    @my_accounts = MyAccount.all

    render json: @my_accounts
  end

  # GET /my_accounts/1
  def show
    render json: @my_account
  end

  # POST /my_accounts
  def create
    @my_account = MyAccount.new(my_account_params)

    if @my_account.save
      render json: @my_account, status: :created, location: @my_account
    else
      render json: @my_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /my_accounts/1
  def update
    if @my_account.update(my_account_params)
      render json: @my_account
    else
      render json: @my_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /my_accounts/1
  def destroy
    @my_account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_account
      @my_account = MyAccount.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def my_account_params
      params.require(:my_account).permit(:total_earning)
    end
end
