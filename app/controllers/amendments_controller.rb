class AmendmentsController < ApplicationController
  before_action :set_amendment, only: [:edit, :update, :destroy]
  before_action :set_client, only: [:new, :create]
  before_action :set_select_arrays, only: [:new, :edit]

  # GET client/1/amendments/new
  def new
    @amendment = @client.amendments.new
    @categories = @client.categories.includes(:scheme).order("schemes.name, categories.description") + (Category.all.includes(:scheme).order("schemes.name, categories.description") - @client.categories)
    @facilities = @client.facilities
    render layout: false
  end

  # GET /amendments/1/edit
  def edit
    @categories = @amendment.client.categories.includes(:scheme).order("schemes.name, categories.description") + (Category.all.includes(:scheme).order("schemes.name, categories.description") - @amendment.client.categories)
    @facilities = @amendment.client.facilities
    render layout: false
  end

  # POST /amendments
  def create
    @amendment = @client.amendments.new(amendment_params)

    respond_to do |format|
      if @amendment.save
        flash[:notice] = "Amendment was succesfully created."
        format.html { redirect_to @amendment.client }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { redirect_to @amendment.client, alert: @combined_errors }
        format.js { render partial: 'shared/formerrors', locals: {object: @amendment} }
      end
    end
  end

  # PATCH/PUT /amendments/1
  def update
    respond_to do |format|
      if @amendment.update(amendment_params)
        flash[:notice] = "Amendment was succesfully updated."
        format.html { redirect_to @amendment.client }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { redirect_to @amendment.client, alert: @combined_errors }
        format.js { render partial: 'shared/formerrors', locals: {object: @amendment} }
      end
    end
  end

  # DELETE /amendments/1
  def destroy
    @amendment.destroy
    redirect_to @amendment.client, notice: 'Amendment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amendment
      @amendment = Amendment.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

    def set_select_arrays
      @amendment_types = ["Listing Addition", "Design Change", "Facility Change", "New Listing Application", "Other"]
      @status_types = ["Waiting for Client Info",
                       "Waiting for Test",
                       "Waiting for Inspection",
                       "Waiting for Evaluation",
                       "Waiting for LRC",
                       "Canceled Before Completion",
                       "Complete"]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amendment_params
      params.require(:amendment).permit(:number, :completed, :project_type, :client_id, :category_id, :models, :old_facility_id, :new_facility_id, :test_reports, :status, :comments)
    end
end
