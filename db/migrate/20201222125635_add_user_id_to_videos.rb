class AddUserIdToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :user_id, :integer
    add_index :videos, :user_id
    add_foreign_key :videos, :users, column: :user_id
  end
end
