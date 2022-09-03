class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :works ,dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :follows
  has_many :favorites

  has_one_attached :image

  validates :name, presence: true
  
  def already_favorited?(work)
    self.favorites.exists?(work_id: work.id)
  end



  #def get_image(width, height)
  #unless image.attached?
    #file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    #image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
  #end
  #image.variant(resize_to_limit: [width, height]).processed
  #endfile_image.variant(resize_to_limit: [100, 100]).processed
  #end

end
