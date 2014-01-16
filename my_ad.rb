class MyAd
  require 'net/ldap'
  require 'yaml'
  #require 'ldap'



  #filter = Net::LDAP::Filter.eq("givenname", "*")
  #base = "ou = personal, ou = Sodertorn, ou = ITG, dc=learnet, dc=se"

  def connect(ldap)
    ldap = Net::LDAP.new
    ldap.host = '172.16.2.12'
    ldap.port = 389
    ldap.auth config['username'], config['password']
    ldap.bind

  end

  def self.find(hash = {})
    config = YAML::load_file('config.yaml')
    filter = Net::LDAP::Filter.eq("givenname", hash.values.first.to_s)
    base = "ou = personal, ou = Sodertorn, ou = ITG, dc=learnet, dc=se"
    ldap = Net::LDAP.new
    ldap.host = '172.16.2.12'
    ldap.port = 389
    ldap.auth config['username'], config['password']
    ldap.bind
    snubbar = []
    ldap.search(:base => base, :filter => filter) do |entry|
      snubbar << entry[:cn]
      #puts TimeConverter.ad_timestamp_to_datetime(entry[:lastlogontimestamp].first)
    end
  end
  #puts snubbar
end