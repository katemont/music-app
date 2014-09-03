class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @track = Track.find(params[:track_id])
    @comment = Comment.build_from(@track, current_user.id, params[:comment][:body] )
    flash[:notice] = "That comment did not save" if !@comment.save
    redirect_to @track
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to track_url 

  end

  def index
    @comments = Comment.by_votes
  end

  def vote
    vote = current_user.comment_votes.new(value: params[:value], comment_id: params[:id])
    if vote.save
      redirect_to :back, notice: "Thank you for voting."
    else
      redirect_to :back, alert: "Unable to vote, perhaps you already did."
    end
  end
end