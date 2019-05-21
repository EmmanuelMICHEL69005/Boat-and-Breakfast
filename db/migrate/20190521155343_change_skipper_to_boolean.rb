class ChangeSkipperToBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column :boats, :skipper, 'boolean USING CAST(FALSE AS boolean)'
  end
end
