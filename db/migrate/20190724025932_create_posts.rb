class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string      :title, null: false
      t.string      :image, null: false
      t.text        :text,  null: false
      t.timestamps
    end
  end
end
