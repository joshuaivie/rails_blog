class RenameImageColumnToPhoto < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :image, :photo
  end
end
