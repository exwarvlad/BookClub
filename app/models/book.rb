class Book < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  mount_uploader :avatar_title, AvatarTitleUploader

  # validates :user, precense: true
  # validates :description, lenght: [maximum: 555]
  # validates :title, precense: true
  # validates :avatar_title, precense: true
end
