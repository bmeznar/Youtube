class Subscription < ApplicationRecord
  belongs_to :subscriber, class_name: "User"
  belongs_to :subscribed_to, class_name: "User"
  #validates :subccribed_to_id, uniqueness: {scope: :subscriber_id}
  #validates :subscriber_id, uniqueness: {scope: :subccribed_to_id}
end
