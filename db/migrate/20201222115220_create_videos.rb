class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    change_table :videos do |t|
      t.string :title
      t.string :video
      t.text :description

      t.timestamps
    end
  end
end
