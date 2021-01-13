class FixColumnName < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :subscriptions, :user_id, :subscriber_id
  end
  def self.down
  end
end
