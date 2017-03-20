class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :post, presence: true
  validates :user, presence: true
  validates :body, presence: true
  validates :email, presence: true, uniqueness: true
end