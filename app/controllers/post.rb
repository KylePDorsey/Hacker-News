get '/posts' do
  @posts = Post.all
  erb :'/posts/index'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments
  erb :'/posts/show'
end

