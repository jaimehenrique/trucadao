class AddBrandAndModelToAd < ActiveRecord::Migration
  def change
    add_reference :ads, :brand, index: true, foreign_key: true
    add_reference :ads, :model, index: true, foreign_key: true
  end
end
