class CategoryStandardsController < ApplicationController
  before_action :set_category, only: [:create, :destroy]

  def create
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category_standard = CategoryStandard.find(params[:id])
    end
end
