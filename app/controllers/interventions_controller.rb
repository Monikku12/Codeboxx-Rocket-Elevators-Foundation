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
      @intervention.employee_id = params[:employee_id]
      @intervention.report = params[:report]
      @customer = Customer.find(params[:customer_id])
      
    respond_to do |format|
      if @intervention.save
        intervention_request = {
          email: "#{@current_user.email}", 
          priority: 1, 
          status: 2,
          type: "Incident",
          subject: "Incident for #{@customer.company_name} from employee ##{@intervention.author}",
          description: "This incident request from employee ID #{@intervention.author} is for our customer #{@customer.company_name}. 
          Their bulding ##{@intervention.building_id} needs an intervention to:
          Battery ##{@intervention.battery_id}
          Column ##{@intervention.column_id}
          Elevator ##{@intervention.elevator_id}
          The intervention has been assigned to the employee ##{@intervention.employee_id}.
          Description of the incident: #{@intervention.report}"
        }.to_json
        puts "&&&&&&&&&&&&&&&&&&&&&&&&"
        puts "#{@current_user.email}"
        puts "#{@customer.company_name}"
        puts "#{@intervention.author}"
        puts "#{@intervention.building_id}"
        puts "#{@intervention.column_id}"
        puts "#{@intervention.elevator_id}"
        puts "#{@intervention.employee_id}"
        puts "#{@intervention.report}"
        puts "&&&&&&&&&&&&&&&&&&&&&&&&"
        
        intervention_request_ticket = RestClient::Request.execute(
          method: :post, 
          url: 'https://codeboxx3519.freshdesk.com/api/v2/tickets',
          # user: 'Np2N3cPBQLFWVi4GVYD',
          user: ENV["freshdesk_api_key"],
          password: "x",
          headers: {
            content_type: "application/json"
          },
          payload: intervention_request
        )
        puts intervention_request_ticket

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