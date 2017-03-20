class Album < ApplicationRecord

belongs_to :user, dependent: :destroy
has_many :photos, dependent: :destroy
validates :title, presence: true


end
