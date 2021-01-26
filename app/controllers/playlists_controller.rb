class PlaylistsController < ApplicationController

  def add
    @video=Video.find(params[:id])
    @playlist=Playlist.new(user_id: current_user.id,
                          video_id: @video.id)
    @playlist.save
    redirect_to video_path
  end

  def remove
    @video=Video.find(params[:id])
    @playlist=Playlist.find_by(video_id: @video.id, 
                          user_id: current_user.id)
    @playlist.destroy
    redirect_to video_path
  end

end
