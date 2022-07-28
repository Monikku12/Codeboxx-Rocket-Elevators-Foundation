class InterventionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_intervention, only: %i[ show edit update destroy ]

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @currentUser = "#{current_user.id}" + " " + current_user.email
    @employee_id = Employee.all.map{ |e| [ "#{e.id}" + " " + e.first_name + " " + e.last_name, e.id ] }
    # @customer_id = "Customer.id + " " + Customer.company_name"
    # @building_id = Building.all.select{ |bu| bu.customer_id  == @customer_id }.map{ |bu| [ "#{bu.id}" + " " + bu.number_and_street, bu.id] }
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /quotes or /quotes.json
  def create
    @intervention = Intervention.new(intervention_params)

    respond_to do |format|
      if @intervention.save
        contact_us = {
          email: "#{@quote.quote_email}", 
          priority: 1, 
          status: 2,
          type: "Feature Request",
          subject: "From #{@quote.compagny_name}",
          description: "A quote resquest for #{@quote.compagny_name} company from the email #{@quote.quote_email} has been made. 
            The quote is for a #{@quote.building_type} building and request a total of #{@quote.amount_of_elevator_needed} elevators from Rocket Elevators.",
        }.to_json
    
        contact_us_ticket = RestClient::Request.execute(
          method: :post, 
          url: 'https://codeboxx3519.freshdesk.com/api/v2/tickets',
          user: ENV["freshdesk_api_key"],
          password: "x",
          headers: {
            content_type: "application/json"
          },
          payload: contact_us
        )
        puts contact_us_ticket

        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy

    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :intervention_started_at, :intervention_ended_at, :result, :report, :status)
    end
end
