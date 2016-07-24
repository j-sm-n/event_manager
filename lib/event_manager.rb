require 'csv'
puts "EventManager initialized."

# lines = File.readlines "event_attendees.csv"
# lines.each_with_index do |line, index|
#   next if index == 0
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end

content = CSV.open "event_attendees.csv", headers: true
content.each do |row|
  name = row[2]
  puts name
end
