class TransactsController < ApplicationController
  before_action :set_transact, only: [:show, :update, :destroy]

  # GET /transacts
  def index
    @transacts = Transact.all

    render json: @transacts
  end

  # GET /transacts/1
  def show
    render json: @transact
  end

  # POST /transacts
  def create
    @transact = Transact.new(transact_params)

    if @transact.save
      render json: @transact, status: :created, location: @transact
    else
      render json: @transact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transacts/1
  def update
    if @transact.update(transact_params)
      render json: @transact
    else
      render json: @transact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transacts/1
  def destroy
    @transact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transact
      @transact = Transact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transact_params
      params.require(:transact).permit(:employee_id, :token_id, :company_id, :third_party_vendor_id, :transact_token, :transact_token_created_at, :employee_id, :company_id, :third_party_vendor_id, :token_id)
    end
end
