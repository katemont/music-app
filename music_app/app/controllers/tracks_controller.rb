class TracksController < ApplicationController
  load_and_authorize_resource
  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
    @comment = Comment.new
    @comments = @track.comment_threads
  end

  def new
    @track = Track.new
  end

  def edit
    @track = Track.find(params[:id])
  end

  def create
    current_user.tracks.create(params[:track])
    
    redirect_to tracks_path
  end

  def update
    @track = Track.find(params[:id])

      if @track.update_attributes(params[:track])
      redirect_to @track, notice: 'Track successfully updated.'
      else
        render action: "edit" 
      end    
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy

    redirect_to tracks_url 

  end
end