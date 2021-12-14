class CreateAuthentications < ActiveRecord::Migration[6.0]
  def self.up
    create_table :authentications do |t|
      t.integer :user_id
      t.string  :provider
      t.string  :uid
      t.timestamps
    end
  end

  def self.down
    drop_table :authentications
  end
end
