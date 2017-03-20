class Photo < ApplicationRecord

belongs_to :album

validates :caption, presence: true


end
