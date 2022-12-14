class Work < ApplicationRecord

  belongs_to :user
  has_many :comments ,dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :favorites ,dependent: :destroy

  has_one_attached :image

  validates :title ,presence: true
  validates :image, presence: true

    def self.looks(search, word)

      if word.blank?
        return
      end

      if search == "perfect_match"
        @work = Work.where("title LIKE? OR genre LIKE?" ,"#{word}","#{word}")
      elsif search == "partial_match"
        @work = Work.where("title LIKE? OR genre LIKE?" ,"%#{word}%","%#{word}%")
      else
        @work = Work.all
      end

    end

end
