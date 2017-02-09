class Book < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  mount_uploader :avatar_title, AvatarTitleUploader

  validates :user, presence: true
  validates :description, length: {maximum: 580}
  validates :title, presence: true, length: {maximum: 30}
  validates :author, presence: true, length: {maximum: 30}
  validates :avatar_title, presence: true

  TITLE_MAX_LENGTH = Book.validators_on(:title).select\
  { |v| v.class == ActiveModel::Validations::LengthValidator }.first.options[:maximum]

end
