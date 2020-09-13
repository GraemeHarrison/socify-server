class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user

  validates_presence_of :comment
  validates_presence_of :commentable
  validates_presence_of :user

  include PublicActivity::Model
  tracked only: [:create], owner: proc { |_controller, model| model.user }
end
