get '/' do
  erb :welcome
end

################# LOGIN #################
get '/login' do
	erb :'auth/login'
end

post '/login' do
	user = User.find_by(name: params[:user][:user_name])
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
		redirect '/signup'
	end
end

################# USER #################
get '/users/:id' do
	if current_user
		@user = User.find_by(id: params[:id])
		erb :profile
	else
		redirect "auth/login"
	end
end

################# USER #################

get "/add_activity/:id" do
	@user = User.find_by(id: params[:id])
	erb :add_activity
end

get "/users/:id/activity/:cat_id/new" do
	@user = User.find_by(id: params[:id])
	@category = Category.find_by(id: params[:cat_id])
	erb :new_activity
end

post "/users/:id/activity/:cat_id/new" do
	p params
	@user = User.find_by(id: params[:id])
	@category = Category.find_by(id: params[:cat_id])
	activity = Activity.new(params[:activity])
	puts "activity"
	p activity
	activity.category_id = @category.id
	activity.user_id = @user.id
	activity.save
	puts "user id"
	puts " user id"
	p @user.id
	redirect "/users/#{@user.id}"
end

get "/users/:id/activity/new" do
	erb :new_form
end


################# LOGOUT #################
get '/logout' do
	logout_user
	redirect '/'
end
