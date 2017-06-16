class RemoveBrandFromAds < ActiveRecord::Migration
  def change
    remove_column :ads, :brand, :string
  end
end
