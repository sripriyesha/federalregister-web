class CreateEntryEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :entry_emails do |t|
      t.string  :remote_ip,       nil: false
      t.integer :num_recipients,  nil: false
      t.integer :entry_id,        nil: false
      t.string  :sender_hash,     nil: false
      t.string  :document_number, nil: false

      t.timestamps
    end
  end
end
