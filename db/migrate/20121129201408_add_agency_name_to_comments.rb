class AddAgencyNameToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :agency_name, :string
  end
end
