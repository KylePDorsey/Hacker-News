get '/posts' do
  @posts = Post.all
  erb :'/posts/index'
end

get '/posts/new' do
  erb :'/posts/new'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments
  erb :'/posts/show'
end

post '/posts' do
  post = Post.new(body: params[:body], user_id: current_user.id, title: params[:title])
  if post.save
    redirect "/posts/#{post.id}"
  else
    @errors = "Something went wrong!"
    erb :'/posts/new'
  end
end


