class AddNewClippingsCountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :new_clippings_count, :integer
  end
end
