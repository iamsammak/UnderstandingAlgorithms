require 'csv'
require 'sqlite3'
require 'byebug'

# Reading the CSV file
companies = CSV.read("TechCrunchcontinentalUSA.csv")

# YOUR CODE GOES HERE
companies_names = []
companies.each { |row| companies_names << row[0] }
debugger

web_companies_names = Hash.new(0)
companies.each do |row|
  if row[3] == "web"
    web_companies_names[row[0]] += 1
  end
end

dup_companies = web_companies_names.select{|k,v| v > 1}

dup_names = []

dup_companies.each do |company_name, v|
  dup_names << company_name
end

companies.each do |row|
  current_company = row[0]
  temp_date = ""
  temp_amt = nil
  if dup_names.include?(row[0])
    #do comparison logic

    temp_date = row[6]
    temp_amt = row[7]
    # parse funding date and funding amount
    # keep funding date and amount
    #
  end
end


begin

  db = SQLite3::Database.open "companies.db"
  db.execute "DROP TABLE IF EXISTS Companies"
  db.execute "CREATE TABLE IF NOT EXISTS Companies(Id INTEGER PRIMARY KEY,
      Permalink TEXT, Company TEXT, NumEmps INT, Catergory TEXT, City TEXT, State TEXT, FundedDate TEXT,
      RaisedAmt INT, RaisedCurrency TEXT, Round TEXT)"

  # YOUR CODE GOES HERE

rescue SQLite3::Exception => e

  puts "Exception occurred"
  puts e

ensure
  db.close if db
end


# BONUS: YOUR CODE GOES HERE
