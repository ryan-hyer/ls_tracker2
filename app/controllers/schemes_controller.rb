class SchemesController < ApplicationController

  # GET /schemes
  # GET /schemes.json
  def index
    @schemes = Scheme.all
  end

  # GET /schemes/new
  def new
    @scheme = Scheme.new
    render layout: false
  end

  # POST /schemes
  # POST /schemes.json
  def create
    @scheme = Scheme.new(scheme_params)

    respond_to do |format|
      if @scheme.save
        format.html { redirect_to schemes_path, notice: 'Scheme was successfully created.' }
        format.json { render :show, status: :created, location: schemes_path }
      else
        format.html { render :new }
        format.json { render json: @scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schemes/1
  # DELETE /schemes/1.json
  def destroy
    @scheme = Scheme.find(params[:id])
    @scheme.destroy
    respond_to do |format|
      format.html { redirect_to schemes_url, notice: 'Scheme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def scheme_params
      params.require(:scheme).permit(:name)
    end
end
