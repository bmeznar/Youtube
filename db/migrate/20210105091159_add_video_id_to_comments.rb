class AddVideoIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :video_id, :integer
    add_index :comments, :video_id
    add_foreign_key :comments, :videos, column: :video_id
  end
end
