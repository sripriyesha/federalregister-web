class RemoveActiveSubscriptionsCountFromMailingLists < ActiveRecord::Migration[6.0]
  def up
    remove_column :mailing_lists, :active_subscriptions_count
  end
end
