class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @subscription=@user.subscribers.find_by(subscriber: current_user)
  end
end
