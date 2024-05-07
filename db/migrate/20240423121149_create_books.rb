class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
    t.integer :user_id
    t.string :title, null: false
    t.text :body, null: false
    t.timestamps
    end
  end
end
