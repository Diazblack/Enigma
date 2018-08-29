require './lib/enigma.rb'
require 'date'
require 'pry'

decrypt_1 = File.open(ARGV[0], "r")
text = decrypt_1.read
decrypt_1.close

e = Enigma.new
my_message = text.strip
date = Date.today
key = "12345"
output = File.open(ARGV[1], "w")

output.write(e.decrypt(my_message, "12345", date))

output.close

puts "Created #{ARGV[1]} with the key #{key} and the date #{e.get_date(date)}"
