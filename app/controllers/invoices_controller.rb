class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.from_year(params[:year] || Time.now.year).order("date_invoiced DESC")
    @years = Invoice.pluck(:date_invoiced).map{|x| x.year}.uniq.sort_by(&:year).reverse!
    @time = Time.new
    @clients = Client.all
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    render layout: false
  end

  # GET /invoices/1/edit
  def edit
    render layout: false
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoices_path, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: invoices_path }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to invoices_path, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: invoices_path }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:number, :client_id, :description, :amount, :date_invoiced, :date_paid)
    end
end
