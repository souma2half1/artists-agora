class Work < ApplicationRecord
  
  belongs_to :user
  has_many :comments ,dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :favorites ,dependent: :destroy
  
  has_one_attached :image
  
  validates :work ,presence: true
  validates :image, presence: true
  
end
