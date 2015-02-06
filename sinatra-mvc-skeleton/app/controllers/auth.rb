get '/' do
  erb :welcome
end

################# LOGIN #################
get '/login' do
	erb :'auth/login' 
end

post '/login' do
	user = User.find_by(name: params[:user][:name])
	if user.try(:authenticate, params[:user][:password])
		session[:user_id] = user.id
		redirect "/user/#{user.id}"
	else
		redirect "/signup"
	end
end

################# SIGNUP #################
get '/signup' do
  	erb :'auth/signup'
end

post '/signup' do
	user = User.create(params[:user])
	if user.save 
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		redirect 'auth/signup'
	end
end

################# USER #################
get '/users/:id' do
	if current_user
		erb :profile
	else 
		redirect "auth/login"
	end
end

################# USER #################

get "/add_activity" do
	erb :add_activity
end

get "/users/:id/activity/new" do
	erb :new_form
end

post "/users/:id/activity/new" do
	redirect "/users/#{params[:id]}"
end

################# LOGOUT #################
post '/logout' do
	logout_user
	redirect '/'
end
