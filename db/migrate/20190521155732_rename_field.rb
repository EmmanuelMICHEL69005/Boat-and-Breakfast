class RenameField < ActiveRecord::Migration[5.2]
  def change
    rename_column :boats, :lenght, :length
    rename_column :boats, :aceesories, :accesories
  end
end
