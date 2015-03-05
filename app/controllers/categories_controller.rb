class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all.includes(:scheme).order("schemes.name, categories.description")
  end

  # GET /categories/new
  def new
    @category = Category.new
    @standards = Standard.all
    @schemes = Scheme.all
    render layout: false   
  end

  # GET /categories/1/edit
  def edit
    @standards = Standard.all
    @schemes = Scheme.all
    render layout: false
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        flash[:notice] = "Category was succesfully created."
        format.html { redirect_to categories_path }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { redirect_to categories_path, alert: @category.errors }
        format.js { render partial: 'shared/formerrors', locals: {object: @category} }
      end
    end
  end

  # PATCH/PUT /categories/1
  def update
    respond_to do |format|
      if @category.update(category_params)
        flash[:notice] = "Category was succesfully updated."
        format.html { redirect_to categories_path }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :new }
        format.js { render partial: 'shared/formerrors', locals: {object: @category} }
      end
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:description, :scheme_id, category_standards_attributes: [:standard_id, :id, :_destroy])
    end
end
