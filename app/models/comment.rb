class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user, presence: true
  validates :book, presence: true
  validates :body, presence: true, length: {maximum: 200}
end
