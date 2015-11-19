class Article < ActiveRecord::Base
  belongs_to :user
  has_many   :comments, :as => :commentable, :dependent => :destroy

  validates_presence_of :body
  validates_presence_of :user_id

  scope :ordered, -> { order('created_at ASC') }

  after_create do
    ProjectEvent.create 'global.article.create.success', { model: self }
  end

end
