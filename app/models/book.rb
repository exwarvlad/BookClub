class Book < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  mount_uploader :avatar_title, AvatarTitleUploader

  validates :user, presence: true
  validates :description, length: {maximum: 555}
  validates :title, presence: true
  validates :avatar_title, presence: true
end
