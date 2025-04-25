class CreateBooks < ActiveRecord::Migration[7.1]
  def up
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.integer :price
      t.string :publisher
      t.date :published
      t.boolean :dl

      t.timestamps
    end
    execute 'CREATE VIEW gihyo_books AS SELECT * FROM books WHERE publisher = "技術評論社"'
  end

  def down
    drop_table :books
    execute 'DROP VIEW gihyo_books'
  end
end
