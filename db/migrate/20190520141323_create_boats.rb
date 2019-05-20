class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :category
      t.string :brand
      t.string :model
      t.integer :capacity
      t.integer :lenght
      t.string :location
      t.integer :price
      t.string :picture
      t.string :aceesories
      t.string :skipper

      t.timestamps
    end
  end
end
