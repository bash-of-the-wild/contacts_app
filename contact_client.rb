require 'http'

system "clear"
puts "Welcome to the Contacts App"
puts ""
puts "Options"
puts "    [1] Display a single contact"
puts "    [2] Display all contacts"
puts ""
print "Pick an option: "
user_option = gets.chomp

if user_option == "1"

  response = HTTP.get("http://localhost:3000/api/one_contact_url")
  contact_hash = response.parse

  puts "#{contact_hash["first_name"]} #{contact_hash["last_name"]}"
  puts "=" * 60
  puts ""
  puts "Email: #{contact_hash["email"]}"
  puts "Phone Number: #{contact_hash["phone_number"]}"

elsif user_option == "2"
    
  response = HTTP.get("http://localhost:3000/api/all_contacts_url")
  contacts_array = response.parse

  puts "All Contacts"
  puts "+ • " * 15
  puts ""

  contacts_array.each do |contact_hash|
    puts "#{contact_hash["first_name"]} #{contact_hash["last_name"]}"
    puts "=" * 60
    puts
    puts "Email: #{contact_hash["email"]}"
    puts "Phone Number: #{contact_hash["phone_number"]}"
    puts ""
    puts "-" * 60
    puts ""
  end

end



