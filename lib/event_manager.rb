require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "484fc9e316cb4ac1892df7f903b9cb57"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir("output") unless Dir.exists? "output"

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def clean_phone_number(phone_number)
  if phone_number.length < 10
    "N/A"
  elsif phone_number.length == 11 && phone_number.first == "1"


end

puts "EventManager initialized."

content = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new(template_letter)

content.each do |row|
  id = row[0]
  name = row[:first_name]
  phone_number = row[:homephone]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  phone_numbers = clean_phone_number(phone_number)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)
end
