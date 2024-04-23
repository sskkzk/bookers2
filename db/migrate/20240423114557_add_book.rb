class AddBook < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :body
      t.string :image
      t.timestamps
    end
  end
end
