class ThirdPartyVendorsController < ApplicationController
  before_action :set_third_party_vendor, only: [:show, :update, :destroy]

  # GET /third_party_vendors
  def index
    @third_party_vendors = ThirdPartyVendor.all

    render json: @third_party_vendors
  end

  # GET /third_party_vendors/1
  def show
    render json: @third_party_vendor
  end

  # POST /third_party_vendors
  def create
    @third_party_vendor = ThirdPartyVendor.new(third_party_vendor_params)

    if @third_party_vendor.save
      render json: @third_party_vendor, status: :created, location: @third_party_vendor
    else
      render json: @third_party_vendor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /third_party_vendors/1
  def update
    if @third_party_vendor.update(third_party_vendor_params)
      render json: @third_party_vendor
    else
      render json: @third_party_vendor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /third_party_vendors/1
  def destroy
    @third_party_vendor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_third_party_vendor
      @third_party_vendor = ThirdPartyVendor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def third_party_vendor_params
      params.require(:third_party_vendor).permit(:company_id, :name, :company_id, :address)
    end
end
