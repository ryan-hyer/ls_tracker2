class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:edit, :update, :destroy]
  before_action :set_client, only: [:new, :create]

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
  # POST /facilities.json
  def create
    @facility = @client.facilities.new(facility_params)

    respond_to do |format|
      if @facility.save
        format.html { redirect_to @facility.client, notice: 'Facility was successfully created.' }
        format.json { render :show, status: :created, location: @facility.client }
      else
        format.html { render :new }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilities/1
  # PATCH/PUT /facilities/1.json
  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to @facility.client, notice: 'Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility.client }
      else
        format.html { render :edit }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1
  # DELETE /facilities/1.json
  def destroy
    @facility.destroy
    respond_to do |format|
      format.html { redirect_to @facility.client, notice: 'Facility was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      params.require(:facility).permit(:client_id, :name, :address, :phone, :poc_name, :poc_phone, :poc_email, :inactive, :comments)
    end
end
