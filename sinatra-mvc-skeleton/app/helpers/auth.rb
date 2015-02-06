def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end

def login_user(user)
	session[:user_id] = user.id
end

def logout_user
	session.delete(:user_id)
end
