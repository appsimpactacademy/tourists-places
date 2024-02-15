class AddPriceToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :accommodations, :price, :decimal
  end
end
