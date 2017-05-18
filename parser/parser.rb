require 'csv'
require 'sqlite3'
require 'byebug'

# Reading the CSV file
companies = CSV.read("TechCrunchcontinentalUSA.csv")

# YOUR CODE GOES HERE

# find all web companies
web_companies = companies.select { |row| row[3] == "web" }

# figure out the duplicates
web_company_names = Hash.new(0)
web_companies.each do |row|
  web_company_names[row[0]] += 1
end

duplicate_names = web_company_names.select { |k, v| v > 1 }

# iterate over the duplicates to...
duplicate_names.each do |dup_name|
  # create a subset of all the actual rows that match current dup_names
  current_group = web_companies.select { |row| row[0] == k }

  # filter by date first, year then month then day then funding amount
  # year date "1-Feb-08"
  # year is always the last two characters
  # most recent year is 2008, and 1999 being the oldest
  years = current_group.map { |row| row[6][-2..-1] }
  # - 17 to reset numbers making 2017 the biggest
  max_year = years.max_by { |year| (year.to_i - 17) % 100 }
  # with max year found, delete the rest
  unwanted_rows = current_group.select { row| row[6][-2..-1] != max_year }
  target_group = current_group.reject { |row| row[6][-2..-1] != max_year }
  # delete all unwanted rows from web_companies
  unwanted_rows.each { |row| web_companies.delete(row) }

  # rinse and repeat for month if focus group isn't one row
  if target_group.length > 1



end

# set aside the rows inside companies that are duplicates



# web_company_names = Hash.new(0)
# companies.each do |row|
#   if row[3] == "web"
#     web_company_names[row[0]] += 1
#   end
# end
#
# dup_companies = web_company_names.select{|k,v| v > 1}
#
# dup_names = []
#
# dup_companies.each do |company_name, v|
#   dup_names << company_name
# end
#
# companies.each do |row|
#   current_company = row[0]
#   temp_date = ""
#   temp_amt = nil
#   if dup_names.include?(row[0])
#     #do comparison logic
#
#     temp_date = row[6]
#     temp_amt = row[7]
#     # parse funding date and funding amount
#     # keep funding date and amount
#     #
#   end
# end


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
