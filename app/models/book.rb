class Book < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  mount_uploader :avatar_title, AvatarTitleUploader

  TITLE_MAXIMUM_LENGTH = 100
  AUTHOR_MAXIMUM_LENGTH = 42
  DESCRIPTION_MAXIMUM_LENGTH = 580

  validates :user, presence: true
  validates :description, length: {maximum: DESCRIPTION_MAXIMUM_LENGTH}
  validates :title, presence: true, length: {maximum: TITLE_MAXIMUM_LENGTH}
  validates :author, presence: true, length: {maximum: AUTHOR_MAXIMUM_LENGTH}
  validates :avatar_title, presence: true

end
