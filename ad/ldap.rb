require 'net/ldap'
require 'yaml'
require_relative 'time_converter'
require_relative 'my_ad'
require_relative 'person'
# require 'person'



people = Person.from_list(MyAd.find(givenname: 'Danie*'))

people.each do |person|
  puts person.name
end

# puts person.lastlogondate
# puts person.days_since_last_logon








#entry.each do |attribute, values|
# puts "-----------------------------"
#puts "#{attribute}:"
#values.each do |value|
# puts value
# end
# end