class InspectionsController < ApplicationController
  before_action :set_inspection, only: [:edit, :update, :destroy]
  before_action :set_facility, only: [:new, :create]

  # GET /inspections
  # GET /inspections.json
  def index
    @inspections = Inspection.all
  end

  # GET /inspections/new
  def new
    @inspection = @facility.inspections.new
    render layout: false
  end

  # GET /inspections/1/edit
  def edit
    render layout:false
  end

  # POST /inspections
  # POST /inspections.json
  def create
    @inspection = @facility.inspections.new(inspection_params)

    respond_to do |format|
      if @inspection.save
        format.html { redirect_to @inspection.facility.client, notice: 'Inspection was successfully created.' }
        format.json { render :show, status: :created, location: @inspection.facility.client }
      else
        format.html { render :new }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inspections/1
  # PATCH/PUT /inspections/1.json
  def update
    respond_to do |format|
      if @inspection.update(inspection_params)
        format.html { redirect_to @inspection.facility.client, notice: 'Inspection was successfully updated.' }
        format.json { render :show, status: :ok, location: @inspection.facility.client }
      else
        format.html { render :edit }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inspections/1
  # DELETE /inspections/1.json
  def destroy
    @inspection.destroy
    respond_to do |format|
      format.html { redirect_to @inspection.facility.client, notice: 'Inspection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end

    def set_facility
      @facility = Facility.find(params[:facility_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inspection_params
      params.require(:inspection).permit(:number, :inspection_date, :comments, :facility_id)
    end
end
