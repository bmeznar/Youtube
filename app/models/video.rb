class Video < ApplicationRecord
  belongs_to :user

  mount_uploader :video, VideoUploader

  has_one_attached :thumbnail
end
