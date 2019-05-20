class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :beginning_date
      t.date :ending_date
      t.integer :total_price
      t.string :picking_place
      t.string :leaving_place

      t.timestamps
    end
  end
end
