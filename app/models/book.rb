class Book < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  mount_uploader :avatar_title, AvatarTitleUploader
end
