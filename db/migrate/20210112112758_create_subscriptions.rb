class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, :null => false
      t.integer :subscribed_to_id, :null => false
    end
  end
end
