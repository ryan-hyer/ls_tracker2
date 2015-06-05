class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:new, :create]

  # GET /listings/new
  def new
    @listing = @client.listings.new
    @categories = Category.all
    render layout: false
  end

  # GET /listings/1/edit
  def edit
    @categories = Category.all
    render layout: false
  end

  # POST /listings
  def create
    @listing = @client.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        flash[:notice] = "Listing was succesfully created."
        format.html { redirect_to @listing.client }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { redirect_to @listing.client, alert: @combined_errors }
        format.js { render partial: 'shared/formerrors', locals: {object: @listing} }
      end
    end
  end

  # PATCH/PUT /listings/1
  def update
    params[:listing][:standard_ids] ||= []

    respond_to do |format|
      if @listing.update(listing_params)
        flash[:notice] = "Listing was succesfully updated."
        format.html { redirect_to @listing.client }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { redirect_to @listing.client, alert: @combined_errors }
        format.js { render partial: 'shared/formerrors', locals: {object: @listing} }
      end
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
    redirect_to @listing.client, notice: 'Listing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:client_id, :category_id, :has_canada, :product_description, :model_numbers, :conditions, :comments, standard_ids: [])
    end
end
