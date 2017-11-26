class TransactsController < ApiController
  before_action :set_transact, only: [:show, :update, :destroy, :request_for_approval, :approve_transaction, :reject_transaction, :book_transaction, :cancel_transaction, :generate_otp, :verify_otp]
  # GET /transacts
  def index
    @transacts = Transact.all
    render json: @transacts
  end

  def get_employee_transact
    @user = current_user.employee
    @transacts = @user.transacts
    render json: @transacts.map{|t| t.transaction_details.last}.compact
  end

  def get_company_transact
    @transacts = []
    @user = current_user.employee
    @company = @user.company
    @company.employees.each do |employee|
      @transacts << employee.transacts
    end
    @transacts = @transacts.flatten.compact
    render json: @transacts
  end
  # GET /transacts/1
  def show
    transact = {}
    # transact = @transact
    transact['employee'] = @transact.employee.email
    transact['company'] = @transact.company.name
    transact['token'] = @transact.token.transaction_token
    transact['vendor'] = @transact.third_party_vendor.name
    transact['transaction_details'] = @transact.transaction_details
    render json: transact
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
    from = params[:from]
    to = params[:to]
    from_date = Date.parse(params[:from_date])
    to_date = Date.parse(params[:to_date])
    journey1 = FlightInformation.where("source_code = ? and destination_code = ? and journey_date >= ?", from, to, from_date)
    journey2 = FlightInformation.where("source_code = ? and destination_code = ? and journey_date >= ?", to, from, to_date)
    @flights = journey1 + journey2
    render json: @flights
  end

  def get_flight
    @flight = FlightInformation.find(params[:id])
    render json: @flight
  end

  # POST select a particular ticket
  def select_flight
    @flight = FlightInformation.find(params[:id])
    @current_employee = current_user.employee
    token = @current_employee.create_token
    @transact = @current_employee.create_transaction(token.id, @flight)
    render json: @transact 
  end

  def request_for_approval
    if !@transact.nil?
      @token = @transact.token
      @token.request_for_approval
      @token.save!
      TransactMailer.request_for_approval(current_user, @transact).deliver_now
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
        TransactMailer.approve_transaction_notification(@transact.employee.user, @transact).deliver_now
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
        TransactMailer.reject_transaction_notification(@transact.employee.user, @transact).deliver_now
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
      TransactMailer.otp_generation(current_user, @transact, otp).deliver_now
      render :text => otp
      return
    end
  end

  def verify_otp
    if !@transact.nil?
      @token = @transact.token
      otp = params[:otp]
      if @token.validate_otp(otp)
        @token.valid
        @token.use
        @token.save!
        TransactMailer.valid_otp(current_user, @transact, otp).deliver_now
        render :json => {code: '200', msg: "Otp verification successful..."}
        return
      else
        # @token.cancel
        # @token.save!
        TransactMailer.invalid_otp(current_user, @transact, otp).deliver_now
        render :json => {code: '401', msg: "Otp Verification failed..."}
        return
      end
    end
  end

  def book_transaction
    if !@transact.nil?
      @token = @transact.token
      # @token.use
      @token.save!
      render :json => {message: "You transaction has been processed"}
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
