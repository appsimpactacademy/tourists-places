class Place < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, :latitude, :longitude, :state, presence: true 
  # validates :image_url, presence: true

  def place_title
    "#{name}, #{city}(#{state})"
  end

  # def google_maps_embed_link(lat, long, place_name)
  #   puts lat, long, place_name
  #   "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3578.9342921273405!2d#{longitude}!3d#{latitude}!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3976c68ff0a2df73%3A0xebff42167ed98c34!2s#{URI.encode_www_form_component(place_name)}!5e0!3m2!1sen!2sin!4v1706161973094!5m2!1sen!2sin"
  # end

  def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "description", "id", "image_url", "latitude", "longitude", "name", "state", "updated_at"]
  end

   def self.ransackable_associations(auth_object = nil)
      []
    end

end
    