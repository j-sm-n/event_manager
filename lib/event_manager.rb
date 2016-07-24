require 'csv'
require 'sunlight-congress'

Sunlight::Congress.api_key = "484fc9e316cb4ac1892df7f903b9cb57"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

puts "EventManager initialized."

content = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
content.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} #{zipcode}"
end
