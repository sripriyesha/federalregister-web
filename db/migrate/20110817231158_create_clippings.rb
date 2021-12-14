class CreateClippings < ActiveRecord::Migration[6.0]
  def self.up
    create_table :clippings do |t|
      t.integer :user_id
      t.string :document_number
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :clippings
  end
end
