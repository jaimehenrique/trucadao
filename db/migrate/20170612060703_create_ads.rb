class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :brand
      t.string :model
      t.references :kind, index: true, foreign_key: true
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
