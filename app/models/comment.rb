class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  validates_presence_of :body
  validates_presence_of :user_id

end
