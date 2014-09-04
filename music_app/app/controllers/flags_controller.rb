class FlagsController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    flag = @comment.flags.new user_id: current_user.id 

    flag.save
    redirect_to @comment.commentable

    flash[:notice] = "That flag did not save - perhaps you already flagged this comment for review" if !flag.save
  end
  
end