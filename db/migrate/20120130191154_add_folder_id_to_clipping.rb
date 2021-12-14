class AddFolderIdToClipping < ActiveRecord::Migration[6.0]
  def change
    add_column :clippings, :folder_id, :integer
  end
end
