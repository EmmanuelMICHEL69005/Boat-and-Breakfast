class Addcolumns < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :user
    add_reference :bookings, :boat
  end
end
