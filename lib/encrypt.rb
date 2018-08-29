require './lib/enigma.rb'
require 'date'
require 'pry'
# don't forget to create the class encrypt
encrypt_1 = File.open(ARGV[0], "r")
text = encrypt_1.read

encrypt_1.close

e = Enigma.new
my_message = text.strip
date = Date.today
key = "12345"
output = File.open(ARGV[1], "w")

output.write(e.encrypt(my_message, "12345", date))

output.close

puts "Created #{ARGV[1]} with the key #{key} and the date #{e.get_date(date)}"
