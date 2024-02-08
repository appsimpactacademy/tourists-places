class AddAttrToAccommodation < ActiveRecord::Migration[7.0]
  def change
    add_reference :accommodations, :place, foreign_key: true
  end
end
