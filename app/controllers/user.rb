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
