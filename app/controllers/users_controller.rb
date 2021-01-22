class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @subscription=@user.subscribers.find_by(subscriber: current_user)
  end

  def myprofile
    @user=current_user.id
    @videos=current_user.videos
  end
end
