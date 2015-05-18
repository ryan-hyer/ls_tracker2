class StandardsController < ApplicationController
  before_action :set_standard, only: [:show, :edit, :update, :destroy]

  # GET /standards
  def index
    @standards = Standard.all.sort { |p1, p2| view_context.natcmp(p1.number, p2.number) }
  end

  # GET /standards/1
  def show
    render layout: false
  end

  # GET /standards/new
  def new
    @standard = Standard.new
    render layout: false
  end

  # GET /standards/1/edit
  def edit
    render layout: false
  end

  # POST /standards
  def create
    @standard = Standard.new(standard_params)

    respond_to do |format|
      if @standard.save
        flash[:notice] = "Standard was succesfully created."
        format.html { redirect_to standards_path }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :new }
        format.js { render partial: 'shared/formerrors', locals: {object: @standard} }
      end
    end
  end

  # PATCH/PUT /standards/1
  def update
    respond_to do |format|
      if @standard.update(standard_params)
        flash[:notice] = "Standard was succesfully updated."
        format.html { redirect_to standards_path }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :edit }
        format.js { render partial: 'shared/formerrors', locals: {object: @standard} }
      end
    end
  end

  # DELETE /standards/1
  def destroy
    @standard.destroy
    redirect_to standards_url, notice: 'Standard was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard
      @standard = Standard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standard_params
      params.require(:standard).permit(:number, :revision, :title, :exceptions)
    end
end
