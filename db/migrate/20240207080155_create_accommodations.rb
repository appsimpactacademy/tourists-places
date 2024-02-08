class CreateAccommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :contact_number
      t.string :city
      t.string :state
      t.string :image_url

      t.timestamps
    end
  end
end
