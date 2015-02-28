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
  # POST /listings.json
  def create
    @listing = @client.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing.client, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing.client }
      else
        @combined_errors = "Error:"
        @listing.errors.full_messages.each do |msg|
          @combined_errors += " #{msg}."
        end
        format.html { redirect_to @listing.client, alert: @combined_errors }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    params[:listing][:standard_ids] ||= []
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing.client, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing.client }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to @listing.client, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      params.require(:listing).permit(:client_id, :category_id, :product_description, :conditions, :comments, standard_ids: [])
    end
end
