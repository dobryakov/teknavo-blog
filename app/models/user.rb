class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :articles, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  scope :subscribed, -> { where(:is_subscribed => true) }

  def can_update?(user)
    user == self
  end

  def unsubscribe_code
    # replace it with your favorite encryption method
    "VERY-SECRET-CODE-#{id}"
  end

end
