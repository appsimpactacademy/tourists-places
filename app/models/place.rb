class Place < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, :latitude, :longitude, :image_url, :state, presence: true 

  def place_title
    "#{name}, #{city}(#{state})"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "description", "id", "image_url", "latitude", "longitude", "name", "state", "updated_at"]
  end

   def self.ransackable_associations(auth_object = nil)
      []
    end

end
