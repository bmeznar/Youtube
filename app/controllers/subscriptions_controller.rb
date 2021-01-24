class SubscriptionsController < ApplicationController

  def create
    #session[:return_to] ||= request.referer
    other_user=User.find(params[:user_id])
    @subscription=Subscription.new(subscriber_id: current_user.id,
                                  subscribed_to_id: other_user.id)
    @subscription.save
    redirect_back fallback_location: root_path
  end

  def destroy
    #session[:return_to] ||= request.referer
    @subscription=Subscription.find(params[:id])
    @subscription.destroy
    redirect_back fallback_location: root_path
  end
  
end
