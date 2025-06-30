class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_check_constraint :posts,
                         "length(title) BETWEEN 3 AND 300",
                         name: "title_length_between_3_and_300"

    add_check_constraint :posts,
                         "length(content) BETWEEN 3 AND 40000",
                         name: "content_length_between_3_and_40000"
  end
end
