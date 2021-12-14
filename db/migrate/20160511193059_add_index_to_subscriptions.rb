class AddIndexToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_index :subscriptions, :email
  end
end
