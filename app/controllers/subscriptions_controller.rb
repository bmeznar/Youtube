class SubscriptionsController < ApplicationController

  def create
    other_user=User.find(params[:user_id])
    @subscription=Subscription.new(subscriber_id: current_user.id,
                                  subscribed_to_id: other_user.id)
    @subscription.save
    redirect_to videos_path()
  end

  def destroy
    @subscription=Subscription.find(params[:id])
    @subscription.destroy
    redirect_to videos_path()
  end
end
