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

# create MONTHS to use later
MONTHS = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

# iterate over the duplicates to...
duplicate_names.keys.each do |dup_name|
  # create a subset of all the actual rows that match current dup_names
  current_group = web_companies.select { |row| row[0] == dup_name }

  # filter by date first, year then month then day then funding amount
  # year date "1-Feb-08"
  # year is always the last two characters
  # most recent year is 2008, and 1999 being the oldest
  years = current_group.map { |row| row[6][-2..-1] }
  # - 17 to reset numbers making 2017 the biggest
  max_year = years.max_by { |year| (year.to_i - 17) % 100 }
  # with max year found, delete the rest
  unwanted_years = current_group.select { |row| row[6][-2..-1] != max_year }
  target_group = current_group.reject { |row| row[6][-2..-1] != max_year }
  # delete all unwanted rows from web_companies
  unwanted_years.each { |row| web_companies.delete(row) }

  # rinse and repeat compare by month, if there are duplicates with max year
  if target_group.length > 1
    months = target_group.map { |row| MONTHS.index(row[6][-6..-4]) }
    max_month = MONTHS[months.max]
    unwanted_months = target_group.select { |row| row[6][-6..-4] != max_month }
    target_group = target_group.reject { |row| row[6][-6..-4] != max_month }
    unwanted_months.each { |row| web_companies.delete(row) }
  end

  # rinse and repeat, compare by day
  if target_group.length > 1
    days = target_group.map { |row| row[6][0..-8] }
    max_day = days.max
    unwanted_days = target_group.select { |row| row[6][0..-8] != max_day}
    target_group = target_group.reject { |row| row[6][0..-8] != max_day}
    unwanted_days.each { |row| web_companies.delete(row) }
  end

  # rinse and repeat, compare by funding amount
  if target_group.length > 1
    amounts = target_group.map { |row| row[7] }
    max_amount = amounts.max
    unwanted_amounts = target_group.select { |row| row[7] != max_amount }
    target_group = target_group.reject { |row| row[7] != max_amount }
    unwanted_amounts.each { |row| web_companies.delete(row) }
  end

  # if there are still dups, then just chose one
  if target_group.length > 1
    unwanted_dups = target_group.drop(1) # the dropped one will be the chosen one
    unwanted_dups.each { |row| web_companies.delete(row) }
  end
end

# Helper to print out remaining duplicates

web_companies.each_with_index do |el, i|
  next if i == web_companies.length - 1
  if web_companies[i + 1][0] == el[0]
    p el
    p web_companies[i + 1]
  end
end

# Helper to verify number and check names
#
p web_companies.map { |el| el[0] }.count

names = web_companies.map { |row| row[0] }.uniq
sorted_names = names.sort_by {|name| name[0]}
count = 0
sorted_names.each do |name|
  p "#{count}: #{name}"
  count += 1
end

p web_companies.map { |el| el[0] }.uniq.count

# begin
#
#   db = SQLite3::Database.open "companies.db"
#   db.execute "DROP TABLE IF EXISTS Companies"
#   db.execute "CREATE TABLE IF NOT EXISTS Companies(Id INTEGER PRIMARY KEY,
#       Permalink TEXT, Company TEXT, NumEmps INT, Catergory TEXT, City TEXT, State TEXT, FundedDate TEXT,
#       RaisedAmt INT, RaisedCurrency TEXT, Round TEXT)"
#
#   # YOUR CODE GOES HERE
#
# rescue SQLite3::Exception => e
#
#   puts "Exception occurred"
#   puts e
#
# ensure
#   db.close if db
# end


# BONUS: YOUR CODE GOES HERE
