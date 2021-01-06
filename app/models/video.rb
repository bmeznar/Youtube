class Video < ApplicationRecord
  belongs_to :user

  mount_uploader :video, VideoUploader

  has_one_attached :thumbnail

  acts_as_commontable dependent: :destroy
end
