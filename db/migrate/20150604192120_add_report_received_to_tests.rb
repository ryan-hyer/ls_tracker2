class AddReportReceivedToTests < ActiveRecord::Migration
  def change
    add_column :tests, :report_received, :date
  end
end
