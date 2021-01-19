class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :videos, dependent: :destroy

  has_one_attached :profilePic, :dependent => :destroy

  acts_as_commontator

  acts_as_voter

  #def self.from_google(uid:, email:, full_name:, avatar_url:)
    #byebug
    #user = User.find_or_create_by(email: email) do |u|
      #u.uid = uid
      #u.name = full_name
      #u.profilePic = avatar_url
      #u.encrypted_password = SecureRandom.hex
    #end
    #user.update(uid: uid, name: full_name, profilePic: avatar_url)
    #byebug
  #end
  #def self.from_google(email:, full_name:, uid:, avatar_url:)
    #$geslo=Devise.friendly_token.first(20)
    #create_with(uid: uid, name: full_name, profilePic: avatar_url, password: $geslo, password_confirmation: $geslo).find_or_create_by!(email: email)
  #end
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
         user = User.create(name: data['name'],
            email: data['email'],
            password: Devise.friendly_token[0,20],
            profilePic: data['avatar_url'],
            uid: data['uid']
         )
    end
    user
end

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
