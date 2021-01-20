class Video < ApplicationRecord
  belongs_to :user

  def self.search(search)
    if search
      where(["lower(title) LIKE lower(?)","%#{search}%"])
    else
      Video.all
    end
  end

  mount_uploader :video, VideoUploader

  has_one_attached :thumbnail, :dependent => :destroy

  acts_as_commontable dependent: :destroy

  acts_as_votable dependent: :destroy
end
