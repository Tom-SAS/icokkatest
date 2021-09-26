class Map < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :user
  has_many :comments
  has_one_attached :image


  with_options presence: true do 
    validates :name
    validates :address
  end


end
