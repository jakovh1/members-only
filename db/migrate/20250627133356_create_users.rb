class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.text :username, null: false

      t.timestamps
    end

    add_check_constraint :users,
                         "length(username) BETWEEN 3 AND 30",
                         name: "username_length_between_3_and_30"
  end
end
