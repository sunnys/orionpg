class TransactsController < ApiController
  before_action :set_transact, only: [:show, :update, :destroy, :request_for_approval, :approve_transaction, :reject_transaction, :book_transaction, cancel_transaction, :generate_otp, :verify_otp]

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

  # POST get deatils of flight
  def get_flights
    # TODO: Change the query accordding to request
    @flights = FlightInformation.all
    render json: @flights
  end

  # POST select a particular ticket
  def select_flight
    @flight = FlightInformation.find(params[:id])
    @current_employee = Employee.first
    token = @current_employee.create_token
    @transact = @current_employee.create_transaction(token.id, @flight)
    render json: @transact 
  end

  def request_for_approval
    if !@transact.nil?
      @token = @transact.token
      @token.request_for_approval
      @token.save!
      render json: @token
    else 
      render json: {message: "No Transaction found!"}
    end
  end

  def approve_transaction
    if !@transact.nil? # and 
      # if current_user.id == @transacts.employee.managers.last.id
        @token = @transact.token
        @token.request_accepted
        @token.save!
        render json: {message: "Token is sent for approval."}
      # else
      #   render json: {message: "No Authorization!"}
      # end
    else 
      render json: {message: "No Transaction found!"}
    end
  end

  def reject_transaction
    if !@transact.nil?
      # if current_user.id == @transacts.employee.managers.last.id
        @token = @transact.token
        @token.request_rejected
        @token.save!
        render json: {message: "Token is sent for approval."}
      # else
      #   render json: {message: "No Authorization!"}
      # end
    else 
      render json: {message: "No Transaction found!"}
    end
  end

  def generate_otp
    if !@transact.nil?
      @token = @transact.token
      otp = @token.generate_otp
      # TODO: send otp via e-mail
      render :text => otp
      return
    end
  end

  def verify_otp
    if !@transact.nil?
      @token = @transact.token
      otp = params[:otp]
      if @token.verify_otp(otp)
        @token.use
        @token.save!
        render :text => "Transaction Successful"
        return
      else
        @token.cancel
        @token.save!
        render :text => "Wrong OTP"
        return
      end
    end
  end

  def book_transaction
    if !@transact.nil?
      @token = @transact.token
      @token.use
      @token.save!
    end
  end

  def cancel_transaction
    if !@transact.nil?
      @token = @transact.token
      @token.cancel
      @token.save!
    end
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
