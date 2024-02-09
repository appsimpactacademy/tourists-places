class RemoveImageUrlFieldFromTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :accommodations, :image_url, :string
  end
end
