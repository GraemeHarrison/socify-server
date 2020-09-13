class Post < ApplicationRecord
  belongs_to :user

  include PublicActivity::Model
  tracked only: [:create], owner: Proc.new{ |controller, model| controller.current_user }

  mount_uploader :attachment, AvatarUploader
end
