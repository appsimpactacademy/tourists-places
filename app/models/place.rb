class Place < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, :latitude, :longitude, :image_url, :state, presence: true 

  def place_title
    "#{name}, #{city}(#{state})"
  end
end
