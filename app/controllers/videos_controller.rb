class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy, :like, :dislike]
  before_action :authenticate_user! , except: [:show, :index]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.search(params[:search])
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    commontator_thread_show(@video)
    #show subscribe
    #@user=User.find(params[:id])
    @subscription=@video.user.subscribers.find_by(subscriber: current_user)
    if user_signed_in?
      @playlist=Playlist.find_by(user_id: current_user.id, video_id: @video.id)
    end
    @rand_videos = Video.where.not(id: @video.id).order('RANDOM()').limit(4)
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.user=current_user

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #LIKE/DISLIKE
  #liking video
  def like
    if current_user.voted_up_on? @video
      @video.unliked_by current_user
      redirect_to video_path
    else
      @video.liked_by current_user
      redirect_to video_path
    end
  end
  #disliking video
  def dislike
    if current_user.voted_down_on? @video
      @video.undisliked_by current_user
      redirect_to video_path
    else
      @video.disliked_by current_user
      redirect_to video_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:title, :video, :description, :thumbnail, :search)
    end
end
