get '/users/new' do
  erb :'/users/new'
end


post '/users' do
  user = User.new(username: params[:username], password: params[:password])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    # @errors = user.errors.full_messages  add later
    erb :'/users/new'
  end
end


get '/login' do
  erb :'/users/login'
end

post '/login' do
  user = User.authenticate(params[:username], params[:password])
  p user
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    # @errors = ["Username or Password are Incorrect!"]
    erb :'/users/new'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
