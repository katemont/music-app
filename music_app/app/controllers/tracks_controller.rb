class TracksController < ApplicationController

  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
  end

  def edit
    @track = Track.find(params[:id])
  end

  def create
    @track = Track.new(params[:track])

      if @track.save
         redirect_to @track, notice: 'Track successfully created.'
      else
        render action: "new" 
      end
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