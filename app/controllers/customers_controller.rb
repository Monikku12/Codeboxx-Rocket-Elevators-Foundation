class CustomersController < ApplicationController
  require 'json'
  require 'dropbox'
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        if "#{@customers.company_contact_email}" = "#{@leads.email}" do |dropbox|
          search_folder = DropboxApi::Client.new(ENV["token"])
          method: :post, 
          url: 'https://api.dropboxapi.com/2/files/search_v2',
          headers: {
            Content-Type:application/json
          },
          {
            "query": "#{@customers.company_name}", 
            "include_highlights": false
          }
          puts search_folder




        create_folder = DropboxApi::Client.new(ENV["token"])
        method: :post, 
        url: 'https://api.dropboxapi.com/2/files/create_folder_v2',
        headers: {
          Content-Type:application/json
          Dropbox-API-Path-Root:{
            ".tag": "namespace_id",
            "namespace_id": "2"
          }
          Dropbox-API-Select-User:dbmid:FDFSVF-DFSDF
          Dropbox-API-Select-Admin:dbmid:FDFSVF-DFSDF
        },
        {
          "path": "/rocket_elevators/#{@customers.company_name}", 
          "autorename": false
        }
        puts create_folder



        # Once file created
        upload_file = DropboxApi::Client.new(ENV["token"])
          method: :post, 
          url: 'https://content.dropboxapi.com/2/files/upload',
          headers: {
            Dropbox-API-Arg:{
              "path": "create_folder/#{@leads.file_attachment}",
              "mode": "add",
              "autorename": true,
              "mute": false,
              "strict_conflict": false
            }
            Dropbox-API-Path-Root:{
              ".tag": "namespace_id",
              "namespace_id": "2"
            }
            Dropbox-API-Select-User:dbmid:FDFSVF-DFSDF
            Dropbox-API-Select-Admin:dbmid:FDFSVF-DFSDF
          },
          puts upload_file




          # on success of Upload file.
          delete_file = 




        puts delete_file











        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:company_name, :company_headquarters_address, :company_contact_full_name, :company_contact_phone, :company_contact_email, :company_description, :service_technical_authority_full_name, :service_technical_authority_phone, :service_technical_manager_email)
    end
end
