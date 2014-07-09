json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :number, :client_id, :description, :amount, :date_invoiced, :date_paid
  json.url invoice_url(invoice, format: :json)
end
