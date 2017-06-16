class RemoveModelsFromAds < ActiveRecord::Migration
  def change
    remove_column :ads, :model, :string
  end
end
