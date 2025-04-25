class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.integer :price
      t.string :publisher
      t.date :published
      t.boolean :dl

      t.timestamps
    end
    add_index :books, :isbn, unique: true
  end
end
