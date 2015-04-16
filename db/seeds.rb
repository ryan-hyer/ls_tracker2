# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(email:'ryan@tei-test.com', password:'Ryan3175', password_confirmation:'Ryan3175')

Client.create!([
  {name: "Inca Plastics Molding Co., Inc.", address: "17129 Koala Rd.\r\nAdelanto, CA 92301\r\nUSA", phone: "909-923-3235", website: "http://www.foo.bar", poc_name: "Bill", poc_title: "Head Honcho", poc_phone: "", poc_email: "jim@foo.bar", invoice_amt: 1500, invoice_freq: "Annual", invoice_month: "July", listing_number: "11K23", effective: "2014-05-08", updated: "2014-05-08", expires: nil, suspended: false, delisted: false, comments: "Some stuff here\r\nBut it's long\r\nReally looooong"},
  {name: "Test Client Bazinga", address: "somewhere\r\nover\r\nthe\r\nrainbow", phone: "123-456-7890", website: "http://www.foo2.bar", poc_name: "George", poc_title: "Pres", poc_phone: "123-456-7891", poc_email: "george@foo.bar", invoice_amt: 4500, invoice_freq: "Monthly", invoice_month: "", listing_number: "10C87", effective: "2012-05-08", updated: "2014-05-08", expires: "2016-03-19", suspended: false, delisted: false, comments: "Some text here"},
  {name: "Test Client Broccoli", address: "5250 China\r\nDistrict 13\r\nChuangua\r\nChina", phone: "1-11-098-765-4321", website: "http://www.foo3.bar", poc_name: "Fred", poc_title: "Janitor", poc_phone: "", poc_email: "fred@foo.bar", invoice_amt: 25000, invoice_freq: "Quarterly", invoice_month: "", listing_number: "17562", effective: "2014-05-08", updated: "2014-05-08", expires: "2017-05-08", suspended: false, delisted: true, comments: "Texty\r\nTexty\r\nText"},
  {name: "Test Client Rover", address: "", phone: "", website: "", poc_name: "", poc_title: "", poc_phone: "", poc_email: "", invoice_amt: nil, invoice_freq: "Annual", invoice_month: "January", listing_number: "11F22", effective: nil, updated: nil, expires: nil, suspended: false, delisted: false, comments: ""},
  {name: "Test Client Tesla", address: "", phone: "", website: "", poc_name: "", poc_title: "", poc_phone: "", poc_email: "", invoice_amt: nil, invoice_freq: "Annual", invoice_month: "January", listing_number: "33333", effective: nil, updated: nil, expires: nil, suspended: false, delisted: true, comments: ""},
  {name: "Test again", address: "", phone: "", website: "", poc_name: "", poc_title: "", poc_phone: "", poc_email: "", invoice_amt: nil, invoice_freq: "Annual", invoice_month: "January", listing_number: "4", effective: nil, updated: nil, expires: nil, suspended: false, delisted: false, comments: ""},
  {name: "And again", address: "307 Evans\r\nCaldwell, ID  83605\r\nUSA", phone: "", website: "", poc_name: "", poc_title: "", poc_phone: "", poc_email: "", invoice_amt: nil, invoice_freq: "Annual", invoice_month: "January", listing_number: "6", effective: nil, updated: nil, expires: nil, suspended: false, delisted: false, comments: ""}
])
Facility.create!([
  {client_id: 1, name: "Somethin Else", address: "948 E. Belmont St.\r\nOntario, CA  91761\r\nUSA", phone: "123-456-1239", poc_name: "George", poc_phone: "121-454-7878", poc_email: "test@go.com", inactive: false, comments: "This is, of course, a test"},
  {client_id: 1, name: "And a new one", address: "Hooray for us\r\n#19 Weird Street\r\nCalabazaville\r\nChanguha\r\nChina", phone: "4432-9898-1321", poc_name: "Ling Ling Xing", poc_phone: "", poc_email: "", inactive: true, comments: ""},
  {client_id: 1, name: "", address: "666 Transylvania Ave\r\nNowhere, UA", phone: "", poc_name: "", poc_phone: "", poc_email: "", inactive: true, comments: ""},
  {client_id: 2, name: "Let's Try This", address: "3615 Voorde Dr.\r\nSouth Bend, IN  46628\r\nUSA", phone: "", poc_name: "", poc_phone: "", poc_email: "", inactive: false, comments: ""},
  {client_id: 5, name: "Vroom", address: "Vroom vroom", phone: "", poc_name: "", poc_phone: "", poc_email: "", inactive: false, comments: ""},
  {client_id: 7, name: "test", address: "307 Evans\r\nCaldwell, ID  83605\r\nUSA", phone: "", poc_name: "", poc_phone: "", poc_email: "", inactive: false, comments: ""},
  {client_id: 6, name: "test again", address: "3380 SW 11th Ave.\r\nFort Lauderdale, FL  33315\r\nUSA", phone: "", poc_name: "", poc_phone: "", poc_email: "", inactive: false, comments: ""},
  {client_id: 4, name: "Red Rover", address: "Ave de los Nogales, Lotes 6 al 11, Manzana 5\r\nParque Industrial Villa Florida\r\nReynosa, Tamaulipas  88730\r\nMexico", phone: "", poc_name: "", poc_phone: "", poc_email: "", inactive: false, comments: ""}
])
Inspection.create!([
  {number: "IS99055", facility_id: 4, inspection_date: "2015-03-18", comments: ""},
  {number: "IS69", facility_id: 1, inspection_date: "2015-03-11", comments: "tagged one thing again"},
  {number: "69", facility_id: 3, inspection_date: "2014-12-25", comments: ""},
  {number: "IS00103", facility_id: 1, inspection_date: "2014-04-03", comments: "Passed, no problems"},
  {number: "7", facility_id: 3, inspection_date: "2005-09-12", comments: ""},
  {number: "IS00001", facility_id: 2, inspection_date: "2003-02-01", comments: "First inspection ever, yay!"},
  {number: "6", facility_id: 3, inspection_date: "2001-02-01", comments: ""}
])
Test.create!([
  {number: "P00999", model: "13579", sample_received: "2005-02-14", inspection_id: 2, comments: nil},
  {number: "", model: "65757BFF", sample_received: "2005-03-22", inspection_id: 2, comments: nil},
  {number: "", model: "FTH6777", sample_received: nil, inspection_id: 6, comments: nil}
])
Scheme.create!([
  {name: "RV"},
  {name: "Chickens"},
  {name: "General"},
  {name: "Forest Creatures"}
])
Category.create!([
  {description: "Roosters", scheme_id: 2},
  {description: "Squirrel", scheme_id: 4},
  {description: "T'Lesa", scheme_id: 4},
  {description: "Something Great", scheme_id: 3},
  {description: "Something Greater", scheme_id: 3},
  {description: "Chemical - Drinking Water System Components - Health Effects", scheme_id: 1},
  {description: "Electrical - Electric Ventilation Fans", scheme_id: 1},
  {description: "Plumbing - Plastic Showers/Bathtubs", scheme_id: 1},
  {description: "Plumbing - Potable Water Tanks", scheme_id: 1},
  {description: "Test Category", scheme_id: 1}
])
Standard.create!([
  {number: "ASME B134", revision: "2011", title: "Chickeedooos", exceptions: "only section 12"},
  {number: "CSA C22.2 No. 113", revision: "2010", title: "Fans and Ventilators", exceptions: "except sections 8-10"},
  {number: "IAPMO TS 11", revision: "2011a", title: "Non-Metallic Fixtures", exceptions: nil},
  {number: "IAPMO TS 4", revision: "2006", title: "Pressurized and Non-Pressurized Potable Water Tanks for Use in Recreational Vehicles", exceptions: ""},
  {number: "IAPMO Z124 / CSA B45.5", revision: "2011", title: "Plastic Plumbing Fixtures", exceptions: nil},
  {number: "NSF 61", revision: "2013", title: "Drinking Water System Components – Health Effects", exceptions: "except section 7"},
  {number: "UL 507", revision: "9th", title: "Electric Fans", exceptions: "except sections 52-55, 65-89, 108-178"}
])
CategoryStandard.create!([
  {category_id: 2, standard_id: 3},
  {category_id: 3, standard_id: 1},
  {category_id: 3, standard_id: 2},
  {category_id: 3, standard_id: 5},
  {category_id: 4, standard_id: 2},
  {category_id: 4, standard_id: 7},
  {category_id: 5, standard_id: 3},
  {category_id: 6, standard_id: 6},
  {category_id: 9, standard_id: 1},
  {category_id: 9, standard_id: 4},
  {category_id: 9, standard_id: 5},
  {category_id: 9, standard_id: 7},
  {category_id: 10, standard_id: 2},
  {category_id: 10, standard_id: 7}
])
Listing.create!([
  {client_id: 1, category_id: 6, product_description: "shorter", conditions: "short", comments: "short", model_numbers: "stuff"},
  {client_id: 2, category_id: 9, product_description: "Test category", conditions: "Testing\r\nTesting\r\nTesting", comments: "More testing", model_numbers: nil},
  {client_id: 1, category_id: 9, product_description: "Potable Holding Tanks", conditions: "1. Product must be installed and operated in strict compliance with all applicable codes, laws, and regulations having the force of law.\r\n2. The unit must be installed, operated, and maintained in strict compliance with the manufacturers instructions.", comments: "Listed to 97 version, tested to 2004 version", model_numbers: "2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 15M, 17, 18, 19, 20, 22, 24, 25, 26, 27, 28, 29, 30, 31, 32, 34, 35, 36, 38, 39, 40, 41, 43, 44, 46, 47, 48, 50, 53, 54, 56, 56A, 58, 60, 62, 64, 64M, 65, 66, 69, 73, 74, 76, 78, 79, 80, 84, 85, 86, 89, 94, 96, 100, 101, 103, 105, 106, 107 112A, 116, 117, 119, 122, 124, 125, 127, 128, 129M, 130, 131, 132, 133, 138, 139, 142, 143, 145, 146, 149M, 152, 164, 175, 186, 190, 191, 193A, 199, 200, 516, 519A, 523, 534, 537A, 544A, 548M, 549A, 550, 567M, 568M, 570, 571A, 584, 587A, 594A, 598, 599, 1001, 1007, 1008, 1010, 1011, 1012, 1014, 1020, 1026, 1028, 1029, 1033, 1034, 1039, 1044, 1047, 1048, 1068, 1081, 1089R, 1200, 1202, 1203, 1205, 1209, 1219, 1228, 1232, 1233, 1234, 1239"}
])
ListingStandard.create!([
  {listing_id: 1, standard_id: 6},
  {listing_id: 2, standard_id: 1},
  {listing_id: 2, standard_id: 5},
  {listing_id: 3, standard_id: 4}
])
Amendment.create!([
  {number: "", completed: "2009-09-24", project_type: "Other", client_id: 1, category_id: nil, models: "", old_facility_id: nil, new_facility_id: nil, test_reports: "", status: "Complete", comments: "Company name changed from XXX to YYY"},
  {number: "LS33333", completed: "2014-03-15", project_type: "Facility Change", client_id: 1, category_id: 3, models: "EFG45362", old_facility_id: 3, new_facility_id: nil, test_reports: "E00195", status: "Complete", comments: ""},
  {number: "LS12345", completed: nil, project_type: "Listing Addition", client_id: 1, category_id: 2, models: "5457657", old_facility_id: nil, new_facility_id: nil, test_reports: "P00874", status: "Waiting for LRC", comments: ""}
])
