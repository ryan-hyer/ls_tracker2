namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Client.create!(name: "Test1",
                   address: "somewhere\r\nover\r\nthe\r\nrainbow", 
                   phone: "791", 
                   website: "www.foo.bar",
                   poc_name: "Jim", 
                   poc_title: "nuttin", 
                   poc_phone: "", 
                   poc_email: "jim@foo.bar", 
                   invoice_amt: 1500, 
                   invoice_freq: "Annual", 
                   invoice_month: "", 
                   listing_number: "11K23", 
                   effective: "2014-05-08", 
                   updated: "2014-05-08", 
                   expires: "2014-05-08", 
                   suspended: false, 
                   delisted: false, 
                   comments: "")
  end
end