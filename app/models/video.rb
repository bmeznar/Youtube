class Video < ApplicationRecord
  belongs_to :user

  mount_uploader :video, VideoUploader

  has_one_attached :thumbnail, :dependent => :destroy

  acts_as_commontable dependent: :destroy

  acts_as_votable dependent: :destroy
end
