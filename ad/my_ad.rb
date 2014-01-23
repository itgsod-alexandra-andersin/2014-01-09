class MyAd
  require 'net/ldap'
  require 'yaml'
  #require 'ldap'



  #filter = Net::LDAP::Filter.eq("givenname", "*")
  #base = "ou = personal, ou = Sodertorn, ou = ITG, dc=learnet, dc=se"

  def self.config
    cfg = YAML::load_file('config/config.yaml')

    ldap = Net::LDAP.new
    ldap.host = '172.16.2.12'
    ldap.port = 389
    ldap.auth cfg['username'], cfg['password']
    return ldap
  end
  def self.connect#(username, password)
    ldap = config
    #ldap.auth username, password
    ldap.bind
    return ldap
  end

  def self.find(hash = {})
    ldap = connect
    base = "ou = Elev, ou = Sodertorn, ou = ITG, dc=learnet, dc=se"
    filter = Net::LDAP::Filter.eq("givenname", hash.values.first.to_s)
    return ldap.search(:base => base, :filter => filter)
  end

end