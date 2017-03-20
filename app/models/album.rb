class Album < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :photos, dependent: :destroy
  validates :title, presence: true

  def thumbnail
    if photos.first
      photos.first.file.url(:thumb)
    else
      'https://unsplash.it/g/100/100'
    end
  end
end
