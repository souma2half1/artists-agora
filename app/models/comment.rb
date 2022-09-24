class Comment < ApplicationRecord

  belongs_to :work
  belongs_to :user
  has_many :reports,dependent: :destroy
end
