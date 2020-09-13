class Post < ApplicationRecord
  belongs_to :user
  acts_as_votable
  acts_as_commentable

  include PublicActivity::Model
  tracked only: [:create], owner: Proc.new{ |controller, model| controller.current_user }

  mount_uploader :attachment, AvatarUploader

  validates_presence_of :content
  validates_presence_of :user
end
