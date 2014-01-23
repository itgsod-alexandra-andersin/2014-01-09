require_relative 'ad/my_ad'
require 'net/ldap'
class Main < Sinatra::Base

  get '/' do
    slim :'login'
  end

  post '/login' do
    usernamearray = {username: params[:username]}
    p '_____________'
    usernamearrayy = usernamearray.values.first
    p usernamearrayy
    if MyAd.find(usernamearrayy)
      p '_____________'
      p usernamearrayy
      p '-------------'
    end
  end




end