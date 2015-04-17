class StaticPagesController < ApplicationController
  def home
  	@projects = Amendment.where("completed IS NULL")
  	@facilities = Facility.joins("INNER JOIN clients ON clients.id = facilities.client_id LEFT OUTER JOIN inspections ON facilities.id = inspections.facility_id")
  												.select("clients.name AS client_name, facilities.address, max(inspections.inspection_date) AS last_inspection")
  												.group("clients.name, facilities.address")
  												.having("max(inspections.inspection_date) < ? OR max(inspections.inspection_date) IS NULL", 12.months.ago)
  												.where("facilities.inactive = ? AND clients.delisted = ?", false, false)
  												.order("max(inspections.inspection_date) DESC, clients.name")
  end
end