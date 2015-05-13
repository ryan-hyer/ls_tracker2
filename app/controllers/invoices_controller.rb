class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:edit, :update, :destroy]

  # GET /invoices
  def index
    @clients = Client.all
    @invoices = Invoice.from_year(params[:year] || Time.now.year).order("date_invoiced DESC")
    @years = Invoice.pluck(:date_invoiced).map{|x| x.year}.uniq.sort_by(&:year).reverse!
    @months = (-1..10).to_a.map { |n| (Time.now + n.months) }
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
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        flash[:notice] = "Invoice was succesfully created."
        format.html { redirect_to invoices_path }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :new }
        format.js { render partial: 'shared/formerrors', locals: {object: @invoice} }
      end
    end
  end

  # PATCH/PUT /invoices/1
  def update
     respond_to do |format|
      if @invoice.update(invoice_params)
        flash[:notice] = "Invoice was succesfully updated."
        format.html { redirect_to invoices_path }
        format.js { render js: 'window.location.reload()' }
      else
        format.html { render :edit }
        format.js { render partial: 'shared/formerrors', locals: {object: @invoice} }
      end
    end
 end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
    format.html { redirect_to invoices_url, notice: 'Invoice was successfully deleted.' }
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
