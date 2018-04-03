class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.text :image
      t.string :title
      t.text :content
      t.string :user_name

      t.timestamps
    end
  end
end
