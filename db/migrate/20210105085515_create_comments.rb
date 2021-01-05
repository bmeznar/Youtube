class CreateComments < ActiveRecord::Migration[6.0]
  def change
    change_table :comments do |t|
      t.text :body

      t.timestamps
    end
  end
end
