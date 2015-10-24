class CommentsController < ApplicationController
  
  def create
    @provider = Provider.find(params[:comment][:provider_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.save
    render action: "create", layout: false
  end
  
  def comment_params
    params.require(:comment).permit!
  end
  
end
