require 'sinatra'
require_relative "./lib/database_auth.rb"

enable :sessions

get '/' do
  erb :index
end

post '/login' do
  username = params['username']
  password = params['password']
  database_auth(username,password)
end

get '/databases' do
  erb :databases
end

def database_auth(username, password)
  db_auth = DatabaseAuth.new(username, password)
  if db_auth.connected?
    redirect '/databases'
  else
    redirect '/'
  end
end
