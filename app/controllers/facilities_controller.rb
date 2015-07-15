class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:edit, :update, :destroy, :geocache]
  before_action :set_client, only: [:new, :create]

  # GET /facilities
  def index
    @facilities = Facility.active.joins(:client).where("clients.status = ?", "Active")
    render json: @facilities
  end

  # GET /facilities/new
  def new
    @facility = @client.facilities.new
    render layout: false
  end

  # GET /facilities/1/edit
  def edit
    render layout: false
  end

  # POST /facilities
  def create
    @facility = @client.facilities.new(facility_params)

    respond_to do |format|
      if @facility.save
        flash[:notice] = "Facility was succesfully created."
        format.html { redirect_to @facility.client }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :new }
        format.js { render partial: 'shared/formerrors', locals: {object: @facility} }
      end
    end
  end

  # PATCH/PUT /facilities/1
  def update
    respond_to do |format|
      if @facility.update(facility_params)
        flash[:notice] = "Facility was succesfully updated."
        format.html { redirect_to @facility.client }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :edit }
        format.js { render partial: 'shared/formerrors', locals: {object: @facility} }
      end
    end
  end

  # PUT /facilities/1/geocache
  def geocache
    @facility.update(facility_params)
    render nothing: true
  end

  # DELETE /facilities/1
  def destroy
    @facility.destroy
    redirect_to @facility.client, notice: 'Facility was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @facility = Facility.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facility_params
      params.require(:facility).permit(:client_id, :name, :address, :phone, :poc_name, :poc_phone, :poc_email, :inactive, :comments, :latitude, :longitude, :last_geocoded)
    end
end
