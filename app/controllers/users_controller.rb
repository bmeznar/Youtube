class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @subscription=@user.subscribers.find_by(subscriber: current_user)
  end

  def myprofile
    @user=current_user.id
    @videos=current_user.videos
    @playlist=Playlist.all.where(user_id: current_user.id)
  end

  def subscribers
    @user=current_user.id
    #@subscriptions=Subscription.all
    #@subscrbed=User.joins("INNER JOIN subscriptions ON subscriber_id=#{current_user.id}")
    @subscrbed=Subscription.all.where(subscriber_id: current_user.id)
    @users=User.all
    #@videos=Video.all.where(user_id: [@subscrbed])
    #@subs=@users.where(id: @subscribed.id)
  end

  def user_profile
    @user=User.find(params[:id])
    @videos=@user.videos
    @subscription=@user.subscribers.find_by(subscriber: current_user)
    @playlist=Playlist.all.where(user_id: @user.id)
    #session[:return_to] ||= request.referer
  end

  def myplaylist
    @playlist=Playlist.all.where(user_id: current_user.id)
  end

end
