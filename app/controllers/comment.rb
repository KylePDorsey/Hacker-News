post '/comment/new/:id' do
  @comment = Comment.new(body: params[:body], post_id: params[:id], user_id: current_user.id)
  unless @comment.save
    @errors = @comment.errors.full_messages
  end
  @post = Post.find(params[:id])
  @comments = @post.comments
  erb :'/posts/show'
end
