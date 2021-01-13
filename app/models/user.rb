class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :videos, dependent: :destroy

  has_one_attached :profilePic, :dependent => :destroy

  acts_as_commontator

  acts_as_voter


  #subscriber
  has_many :subscribed_chanels, foreign_key: "subscriber_id", class_name: 'Subscription'
  #has_many :subscribers, through: :subscribed_users
  has_many :subscribers, foreign_key: "subscribed_to_id", class_name: 'Subscription'
  #has_many :subscribed_tos, through: :subscribing_users
  #has_many :subscriber_associations, :foreign_key => :subscriber_id, :class_name => 'Subscription'
  #has_many :subscribing_user_associations, :through => :subscriber_associations, :source => :subscribed_to
  #subscribed_toright
  #has_many :subscribed_to_associations, :foreign_key => :subscribed_to_id, :class_name => 'Subscription'
  #has_many :subscribing_chanel_associations, :through => :subscribed_to_associations, :source => :subscriber
  #def associations
    #(subscribing_user_associations + subscribing_chanel_associations).flatten.uniq
  #end
end
