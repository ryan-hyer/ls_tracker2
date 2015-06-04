class StaticPagesController < ApplicationController
  def home
  	@projects = Amendment.includes(:client)
  	                     .order("clients.name, amendments.number")
  	                     .where("amendments.completed IS NULL")
  	@facilities = Facility.joins("INNER JOIN clients ON clients.id = facilities.client_id LEFT OUTER JOIN inspections ON facilities.id = inspections.facility_id")
  												.select("clients.name AS client_name, facilities.address, max(inspections.inspection_date) AS last_inspection")
  												.group("clients.name, facilities.address")
  												.having("max(inspections.inspection_date) < ? OR max(inspections.inspection_date) IS NULL", 12.months.ago)
  												.where("facilities.inactive = ? AND clients.delisted = ?", false, false)
  												.order("max(inspections.inspection_date) NULLS FIRST, clients.name")
  	@tests = Test.joins("INNER JOIN inspections on inspections.id = tests.inspection_id INNER JOIN facilities on facilities.id = inspections.facility_id INNER JOIN clients on clients.id = facilities.client_id")
  	             .where("tests.report_received IS NULL AND clients.delisted = ? AND facilities.inactive = ? AND inspections.inspection_date > ?", false, false, 12.months.ago)
  	             .order("inspections.inspection_date, clients.name, tests.model")
  	@invoices = Invoice.where("date_paid IS NULL").order("date_invoiced")
  end
end