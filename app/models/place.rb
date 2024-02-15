# The CGI.escape method is a standard Ruby library that provides URL encoding (for google_maps_embed)
require 'cgi'

class Place < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, :latitude, :longitude, :state, presence: true 
  # validates :image_url, presence: true

  has_many :accommodations

  has_many_attached :images

  def place_title
    "#{name}, #{city}(#{state})"
  end

  def google_maps_embed_link(accommodation)
    markers = accommodations.map { |accommodation| "#{accommodation.latitude},#{accommodation.longitude}" }
    place_name = "Van Vihar National Park, Bhopal, Madhya Pradesh"
    place_latitude = 23.2346
    place_longitude = 77.3769
    # accommodation_latitude = accommodation.latitude
    # accommodation_longitude = accommodation.longitude

    place_name_encoded = CGI.escape(place_name)
    # accommodation_marker = "#{accommodation_latitude},#{accommodation_longitude}"

    "https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d1811.7148585310736!2d#{place_longitude}!3d#{place_latitude}!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1s#{place_name_encoded}!5e0!3m2!1sen!2sin!4v1706525941569!5m2!1sen!2sin&markers=#{markers}"
  end


  # def google_maps_embed_link
  #   place_name = "Van Vihar National Park, Bhopal, Madhya Pradesh"
  #   place_latitude = 23.2346
  #   place_longitude = 77.3769
  #   accommodation_latitude = 23.2279
  #   accommodation_longitude = 77.3891

  #   place_name_encoded = CGI.escape(place_name)
  #   accommodation_marker = "#{accommodation_latitude},#{accommodation_longitude}"

  #   "https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d1811.7148585310736!2d#{place_longitude}!3d#{place_latitude}!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1s#{place_name_encoded}!5e0!3m2!1sen!2sin!4v1706525941569!5m2!1sen!2sin&markers=#{accommodation_marker}"
  # end


  def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "description", "id", "image_url", "latitude", "longitude", "name", "state", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
