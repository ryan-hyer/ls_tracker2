class SchemesController < ApplicationController
  before_action :set_scheme, only: [:edit, :update, :destroy]

  # GET /schemes
  def index
    @schemes = Scheme.all
  end

  # GET /schemes/new
  def new
    @scheme = Scheme.new
    render layout: false
  end

  # GET /schemes/1/edit
  def edit
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

  # PATCH/PUT /schemes/1
  def update
    respond_to do |format|
      if @scheme.update(scheme_params)
        flash[:notice] = "Scheme was succesfully updated."
        format.html { redirect_to schemes_path }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :edit }
        format.js { render partial: 'shared/formerrors', locals: {object: @scheme} }
      end
    end
  end

  # DELETE /schemes/1
  def destroy
    @scheme.destroy
    redirect_to schemes_url, notice: 'Scheme was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheme
      @scheme = Scheme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheme_params
      params.require(:scheme).permit(:name)
    end
end
