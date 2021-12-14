class AddSubmissionKeyToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :submission_key, :string
  end
end
