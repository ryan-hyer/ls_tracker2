class SchemesController < ApplicationController

  # GET /schemes
  def index
    @schemes = Scheme.all
  end

  # GET /schemes/new
  def new
    @scheme = Scheme.new
    render layout: false
  end

  # POST /schemes
  def create
    @scheme = Scheme.new(scheme_params)

    respond_to do |format|
      if @scheme.save
        flash[:notice] = "Scheme was succesfully created."
        format.html { redirect_to schemes_path }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :new }
        format.js { render partial: 'shared/formerrors', locals: {object: @scheme} }
      end
    end
  end

  # DELETE /schemes/1
  def destroy
    @scheme = Scheme.find(params[:id])
    @scheme.destroy
    redirect_to schemes_url, notice: 'Scheme was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def scheme_params
      params.require(:scheme).permit(:name)
    end
end
