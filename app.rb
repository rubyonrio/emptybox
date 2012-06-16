require 'sinatra'

get '/' do
  erb :index
end

post '/login' do
  erb :show
end
