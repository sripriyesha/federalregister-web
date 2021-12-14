class AddMailingListIdAndDeletedAtIndexToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_index(:subscriptions, [:mailing_list_id, :deleted_at])
  end
end
