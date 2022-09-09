class Work < ApplicationRecord

  belongs_to :user
  has_many :comments ,dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :favorites ,dependent: :destroy

  has_one_attached :image

  validates :work ,presence: true
  validates :image, presence: true

    def self.looks(search, word)

      if search == "perfect_match"
        @work = Work.where("work LIKE?","#{word}")
      elsif search == "forward_match"
        @work = Work.where("work LIKE?","#{word}%")
      elsif search == "Wackward_match"
        @work = Work.where("work LIKE?","%#{word}")
      elsif search == "partial_match"
        @work = Work.where("work LIKE?","%#{word}%")
      else
        @work = Work.all
      end

    end

end
