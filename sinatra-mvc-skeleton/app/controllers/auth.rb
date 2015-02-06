get '/' do
  erb :'welcome'
end

get '/login' do
  erb :'auth/login'
end

get '/signup' do

end
