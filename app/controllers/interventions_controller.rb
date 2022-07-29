class InterventionsController < ApplicationController
  require 'rubygems'
  require 'rest_client'
  require 'json'
  require 'devise'
  
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
    # @currentUser = current_user.find(params[:id])
    # @currentUser = "#{current_user.id}" + " " + current_user.email
    puts "*****************"
    puts current_user.id
    puts "****************"
    # @employee_id = Employee.all.map{ |e| [ "#{e.id}" + " " + e.first_name + " " + e.last_name, e.id ] }
    # @customer_id = "Customer.id + " " + Customer.company_name"
    # @building_id = Building.all.select{ |bu| bu.customer_id  == @customer_id }.map{ |bu| [ "#{bu.id}" + " " + bu.number_and_street, bu.id] }
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
      @intervention.author = current_user.id
      @intervention.customer_id = params[:customer_id]
      @intervention.building_id = params[:building_id]
      @intervention.battery_id = params[:battery_id]
      @intervention.column_id = params[:column_id]
      @intervention.elevator_id = params[:elevator_id]
      @customer = Customer.all
      @customer.compagny_name = @customer.find()
    puts "**************************"
    puts @intervention
    puts "************************"
    respond_to do |format|
      if @intervention.save
        intervention = {
          requester: "#{@intervention.author}", 
          Customer: "#{@customer.company_name}",
          building_id: "#{@intervention.building_id}",
          battery_id: "#{@intervention.battery_id}",
          column_id: "#{@intervention.column_id}",
          elevator_id: "#{@intervention.elevator_id}",
          assigned_to: "#{@intervention.employee_id}",
          description: "#{@intervention.report}",
        }.to_json
    
        intervention_ticket = RestClient::Request.execute(
          method: :post, 
          url: 'https://codeboxx3519.freshdesk.com/api/v2/tickets',
          user: ENV["freshdesk_api_key"],
          password: "x",
          headers: {
            content_type: "application/json"
          },
          payload: intervention
        )
        puts intervention_ticket

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
