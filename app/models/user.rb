class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :works ,dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships,foreign_key: :following_id
  has_many :followings,through: :relationships, source: :follower
  has_many :reverse_of_relationships,class_name:'Relationship',foreign_key: :follower_id
  has_many :followers,through: :reverse_of_relationships, source: :following

  has_one_attached :image

  validates :name, presence: true
  
  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end

  def already_favorited?(work)
    self.favorites.exists?(work_id: work.id)
  end
  
  def is_guest?
    if self.email != "guest@example.com"
      return false
    end
    return true
  end

  def self.looks(search, word)
    
      if word.blank?
        return
      end
    
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
    
  end

end
