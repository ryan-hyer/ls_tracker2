# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(email:'ryan@tei-test.com', password:'Ryan3175', password_confirmation:'Ryan3175')

Client.create!(name: "Inca Plastics Molding Co., Inc.",
	address: "17129 Koala Rd.\r\nAdelanto, CA 92301\r\nUSA",
	phone: "909-923-3235", website: "http://www.foo.bar",
	poc_name: "Bill", poc_title: "Head Honcho",
	poc_phone: "", poc_email: "jim@foo.bar",
	invoice_amt: 1500, invoice_freq: "Annual", invoice_month: "July",
	listing_number: "11K23", effective: "2014-05-08", updated: "2014-05-08", 
	expires: nil, suspended: false, delisted: false,
	comments: "Some stuff here\r\nBut it's long\r\nReally looooong")
Client.create!(name: "Test Client Bazinga",
	address: "somewhere\r\nover\r\nthe\r\nrainbow",
	phone: "123-456-7890", website: "http://www.foo2.bar",
	poc_name: "George", poc_title: "Pres",
	poc_phone: "123-456-7891", poc_email: "george@foo.bar",
	invoice_amt: 4500, invoice_freq: "Monthly", invoice_month: "",
	listing_number: "10C87", effective: "2012-05-08", updated: "2014-05-08",
	expires: "2016-03-19", suspended: false, delisted: false,
	comments: "Some text here")
Client.create!(name: "Test Client Broccoli",
	address: "5250 China\r\nDistrict 13\r\nChuangua\r\nChina",
	phone: "1-11-098-765-4321", website: "http://www.foo3.bar",
	poc_name: "Fred", poc_title: "Janitor",
	poc_phone: "", poc_email: "fred@foo.bar",
	invoice_amt: 25000, invoice_freq: "Quarterly", invoice_month: "",
	listing_number: "17562", effective: "2014-05-08", updated: "2014-05-08",
	expires: "2017-05-08", suspended: false, delisted: true,
	comments: "Texty\r\nTexty\r\nText")

Facility.create!(client_id: 1, name: "Somethin' Else",
	address: "somewhere out there\r\nYada Yada, CA 12345\r\nUSA",
	phone: "123-456-1234", poc_name: "George",
	poc_phone: "121-454-7878", poc_email: "test@go.com",
	inactive: false, comments: "This is, of course, a test")
Facility.create!(client_id: 1, name: "And a new one",
	address: "Hooray for us\r\n#19 Weird Street\r\nCalabazaville\r\nChanguha\r\nChina",
	phone: "4432-9898-1321", poc_name: "Ling Ling Xing",
	poc_phone: "", poc_email: "", inactive: true, comments:"")

Invoice.create!(number: "Next Number", client_id: 1, description: "Annual Listing Fee 2014",
	amount: 1500.0, date_invoiced: "2014-07-09")

Category.create!(description: "Plumbing - Plastic Sinks")
Category.create!(description: "Plumbing - Plastic Showers/Bathtubs")
Category.create!(description: "Electrical - Electric Ventilation Fans")
c = Category.create!(description: "Chemical - Drinking Water System Components - Health Effects")

Standard.create!(number: "IAPMO TS 11", revision: "2011a",
	title: "Non-Metallic Fixtures")
Standard.create!(number: "IAPMO Z124 / CSA B45.5", revision: "2011",
	title: "Plastic Plumbing Fixtures")
Standard.create!(number: "CSA C22.2 No. 113", revision: "2010",
	title: "Fans and Ventilators",
	exceptions: "except sections 8-10")
Standard.create!(number: "UL 507", revision: "9th",
	title: "Electric Fans",
	exceptions: "except sections 52-55, 65-89, 108-178")
s = Standard.create!(number: "NSF 61", revision: "2013",
	title: "Drinking Water System Components – Health Effects",
	exceptions: "except section 7")

CategoryStandard.create!(category_id: c.id, standard_id: s.id)