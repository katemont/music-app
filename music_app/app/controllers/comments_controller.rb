class CommentsController < ApplicationController

  def create
    @track = Track.find(params[:track_id])
    @comment = Comment.build_from(@track, current_user.id, params[:comment][:body] )
    flash[:notice] = "That comment did not save" if !@comment.save
    redirect_to @track
  end

end