class Map < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images


  with_options presence: true do 
    validates :name
    validates :address
  end

  # validates :content, presence: true, unless: :was_attached?

  # def was_attached?
  #   self.image.attached?
  # end

end
