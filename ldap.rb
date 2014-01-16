require 'net/ldap'
require 'yaml'
require_relative 'time_converter'
require_relative 'my_ad'
# require 'person'

config = YAML::load_file('config.yaml')

ldap = Net::LDAP.new
ldap.host = '172.16.2.12'
ldap.port = 389
ldap.auth config['username'], config['password']
ldap.bind


person = MyAd.find(givenname: 'Lars*').first

puts person.name

# puts person.lastlogondate
# puts person.days_since_last_logon








#entry.each do |attribute, values|
# puts "-----------------------------"
#puts "#{attribute}:"
#values.each do |value|
# puts value
# end
# end