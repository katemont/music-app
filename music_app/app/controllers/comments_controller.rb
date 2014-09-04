class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def edit
    @track = Track.find(params[:track_id])
    @comment = Comment.find(params[:id])
  end

  def create
    @track = Track.find(params[:track_id])
    @comment = Comment.build_from(@track, current_user.id, params[:comment][:body] )
    flash[:notice] = "You need to be logged in to comment" if !@comment.save
    redirect_to @track
  end

  def update
    @track = Track.find(params[:track_id])

    if @comment.update_attributes(params[:comment])
    redirect_to @track, notice: 'Track successfully updated.'
    else
      render action: "edit" 
    end   
  end

  def destroy
    @track = Track.find(params[:track_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @track
  end
  
end