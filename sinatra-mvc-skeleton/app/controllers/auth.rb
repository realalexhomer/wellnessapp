get '/' do
  erb :welcome
end

################# LOGIN #################
get '/login' do
	erb ######
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
  	erb ######
end

post '/signup' do
	user = User.create(params[:user])
	if user.save 
		session[:user_id] = user.id
		redirect "/user/:id"
	else
		redirect '/signup'
	end
end

################# USER #################
get "/users/:id"
	if current_user
		erb :profile
	else 
		redirect "/login"
	end
end

################# USER #################

get "/add_activity"
	erb :add_activity
end

get "/users/:id/activity/new"
	erb :new_form
end

post "/users/:id/activity/new"
	redirect "/users/:id"
end

################# LOGOUT #################
post '/logout' do
	logout_user
	redirect '/'
end
