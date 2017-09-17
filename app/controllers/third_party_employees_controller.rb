class ThirdPartyEmployeesController < ApplicationController
  before_action :set_third_party_employee, only: [:show, :update, :destroy]

  # GET /third_party_employees
  def index
    @third_party_employees = ThirdPartyEmployee.all

    render json: @third_party_employees
  end

  # GET /third_party_employees/1
  def show
    render json: @third_party_employee
  end

  # POST /third_party_employees
  def create
    @third_party_employee = ThirdPartyEmployee.new(third_party_employee_params)

    if @third_party_employee.save
      render json: @third_party_employee, status: :created, location: @third_party_employee
    else
      render json: @third_party_employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /third_party_employees/1
  def update
    if @third_party_employee.update(third_party_employee_params)
      render json: @third_party_employee
    else
      render json: @third_party_employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /third_party_employees/1
  def destroy
    @third_party_employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_third_party_employee
      @third_party_employee = ThirdPartyEmployee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def third_party_employee_params
      params.require(:third_party_employee).permit(:third_party_vendor_id, :name, :company_id, :email)
    end
end
