class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  BODY_MAXIMUM_LENGTH = 200

  validates :user, presence: true
  validates :book, presence: true
  validates :body, presence: true, length: {maximum: BODY_MAXIMUM_LENGTH}
end
