
post '/votes/:id' do
  vote = Vote.create(voteable_id: params[:id], voteable_type: params[:type])
  type = vote.voteable_type
  id = vote.voteable_id
  if type == "Comment"
    comment = Comment.find(id)
    post_id = comment.post.id
    redirect "/posts/#{post_id}"
  else
    if request.xhr?
      post = Post.find(params[:id])
      vote_count = post.votes.count.to_s
    else
      redirect '/'
    end
  end
end


