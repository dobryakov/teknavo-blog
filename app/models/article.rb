class Article < ActiveRecord::Base
  belongs_to :user
  has_many   :comments, :as => :commentable, :dependent => :destroy

  validates_presence_of :body
  validates_presence_of :user_id

  scope :reverse_ordered, -> { order('created_at DESC') }

end
