class InspectionsController < ApplicationController
  before_action :set_inspection, only: [:edit, :update, :destroy]
  before_action :set_facility, only: [:new, :create]

  # GET /inspections
  def index
    @clients = Client.active
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
  def create
    @inspection = @facility.inspections.new(inspection_params)

    respond_to do |format|
      if @inspection.save
        flash[:notice] = "Inspection was succesfully created."
        format.html { redirect_to @inspection.facility.client }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :new }
        format.js { render partial: 'shared/formerrors', locals: {object: @inspection} }
      end
    end
  end

  # PATCH/PUT /inspections/1
  def update
    respond_to do |format|
      if @inspection.update(inspection_params)
        flash[:notice] = "Inspection was succesfully updated."
        format.html { redirect_to @inspection.facility.client }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :edit }
        format.js { render partial: 'shared/formerrors', locals: {object: @inspection} }
      end
    end
  end

  # DELETE /inspections/1
  def destroy
    @inspection.destroy
    redirect_to @inspection.facility.client, notice: 'Inspection was successfully destroyed.'
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
      params.require(:inspection).permit(:number, :inspection_date, :comments, :facility_id, tests_attributes: [:id, :inspection_id, :model, :number, :sample_received, :report_received, :_destroy])
    end
end
