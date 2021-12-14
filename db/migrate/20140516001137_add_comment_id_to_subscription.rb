class AddCommentIdToSubscription < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :comment_id, :integer
    add_index :subscriptions, :comment_id

    remove_column :comments, :followup_document_notification
    remove_column :comments, :followup_document_number
  end
end
