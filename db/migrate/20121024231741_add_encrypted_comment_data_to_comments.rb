class AddEncryptedCommentDataToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :salt, :string
    add_column :comments, :iv, :string
    add_column :comments, :encrypted_comment_data, :binary
  end
end
