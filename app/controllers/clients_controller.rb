class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients/restatus
  def restatus
    Client.all.each do |client|
      if client.delisted
        client.update(status: "Delisted")
      elsif client.suspended
        client.update(status: "Suspended")
      else
        client.update(status: "Active")
      end
    end
    render text: "Success"
  end
  
  # GET /clients
  def index
    @active_clients = Client.active
    @delisted_clients = Client.delisted
    @new_applications = Client.newapp
  end

  # GET /clients/1
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
    render layout: false
  end

  # GET /clients/1/edit
  def edit
    render layout: false
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        flash[:notice] = "Client was succesfully created."
        format.html { redirect_to @client }
        format.js { render js: %(window.location.href='#{client_path @client}') }
      else
        format.html { render :new }
        format.js { render partial: 'shared/formerrors', locals: {object: @client} }
      end
    end
  end

  # PATCH/PUT /clients/1
  def update
    respond_to do |format|
      if @client.update(client_params)
        flash[:notice] = "Client was succesfully updated."
        format.html { redirect_to @client }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :edit }
        format.js { render partial: 'shared/formerrors', locals: {object: @client} }
      end
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :address, :phone, :website, :poc_name, :poc_title, :poc_phone, :poc_email, :invoice_amt, :invoice_freq, :invoice_month, :listing_number, :effective, :updated, :expires, :status, :comments)
    end
end
