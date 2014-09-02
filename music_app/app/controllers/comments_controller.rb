class CommentsController < ApplicationController

  # def create
  #   @comment_hash = params[:comment]
  #   @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
  #   # Not implemented: check to see whether the user has permission to create a comment on this object
  #   @comment = Comment.new(commentable: @obj, user_id: current_user.id, body: @comment_hash[:body])
  #   if @comment.save
  #     redirect_to tracks_path @track
  #   else
  #     render new
  #   end
  # end

  def create
    @track = Track.find(params[:track_id])
    @comment = Comment.build_from(@track, current_user.id, params[:comment][:body] )
    flash[:notice] = "That comment did not save" if !@comment.save
    redirect_to @track
  end

end