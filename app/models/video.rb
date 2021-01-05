class Video < ApplicationRecord
  belongs_to :user

  has_many :comments

  mount_uploader :video, VideoUploader

  has_one_attached :thumbnail
end
