class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

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

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.google_oauth2"] && session["devise.google_oauth2_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.profilePic = auth.info.image
  end

  #def self.from_omniauth(access_token)
    #where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #  user.email = auth.info.email
    #  user.password = Devise.friendly_token[0, 20]
    #  user.name = auth.info.name
    #  user.profilePic = auth.info.image
    #end
    #data = access_token.info
    #user = User.where(email: data['email']).first

    #unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20],
    #        profilePic: data['image'],
    #        uid: data['uid'],
    #        provider: data['provider']
    #     )
    #end
    #user
  #end

  has_many :playlists, :dependent => :destroy

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
