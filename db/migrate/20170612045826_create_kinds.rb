class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.string :description, limit: 60

      t.timestamps null: false
    end
  end
end
