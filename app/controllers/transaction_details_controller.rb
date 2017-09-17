class TransactionDetailsController < ApplicationController
  before_action :set_transaction_detail, only: [:show, :update, :destroy]

  # GET /transaction_details
  def index
    @transaction_details = TransactionDetail.all

    render json: @transaction_details
  end

  # GET /transaction_details/1
  def show
    render json: @transaction_detail
  end

  # POST /transaction_details
  def create
    @transaction_detail = TransactionDetail.new(transaction_detail_params)

    if @transaction_detail.save
      render json: @transaction_detail, status: :created, location: @transaction_detail
    else
      render json: @transaction_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transaction_details/1
  def update
    if @transaction_detail.update(transaction_detail_params)
      render json: @transaction_detail
    else
      render json: @transaction_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transaction_details/1
  def destroy
    @transaction_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_detail
      @transaction_detail = TransactionDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_detail_params
      params.require(:transaction_detail).permit(:transaction_id, :transaction_id, :type, :source, :destination, :amount, :confirmed)
    end
end
