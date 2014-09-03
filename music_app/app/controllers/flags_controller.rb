class FlagsController < ApplicationController

  def create
    a = params[:comment_id]
    b = true
    c = current_user
    flag = Flag.new comment_id: a, value: b, user_id: c

    flag.save

    @track = Track.find(params[:track_id])
    redirect_to @track
  end

end