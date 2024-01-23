class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :state
      t.string :city
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
