class TestsController < ApplicationController
  before_action :set_test, only: [:edit, :update, :destroy]

  # GET /tests/new
  def new
    @test = Test.new
    render layout: false
  end

  # GET /tests/1/edit
  def edit
    render layout: false
  end

  # POST /tests
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        flash[:notice] = "Test was succesfully created."
        # This might get hairy when we link tests to Projects
        format.html { redirect_to @test.inspection.facility.client }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :new }
        format.js { render partial: 'shared/formerrors', locals: {object: @test} }
      end
    end
  end

  # PATCH/PUT /tests/1
  def update
    respond_to do |format|
      if @test.update(test_params)
        flash[:notice] = "Test was succesfully updated."
        format.html { redirect_to @test.inspection.facility.client }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :edit }
        format.js { render partial: 'shared/formerrors', locals: {object: @test} }
      end
    end
  end

  # DELETE /tests/1
  def destroy
    @test.destroy
    redirect_to tests_url, notice: 'Test was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:number, :model, :sample_received, :report_received, :inspection_id, :standard_id, :project_id, :comments)
    end
end
