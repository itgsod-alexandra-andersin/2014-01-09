require 'net/ldap'
require 'yaml'
require_relative 'time_converter'
require_relative 'my_ad'
# require 'person'



person = MyAd.find(givenname: 'Daniel*').first


lastlogondate

puts person.cn
puts TimeConverter(person.lastlogon)

# puts person.lastlogondate
# puts person.days_since_last_logon








#entry.each do |attribute, values|
# puts "-----------------------------"
#puts "#{attribute}:"
#values.each do |value|
# puts value
# end
# end