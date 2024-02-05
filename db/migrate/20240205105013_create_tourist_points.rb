class CreateTouristPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :tourist_points do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :distance_from
      t.string :city
      t.string :state
      t.string :image_url
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
