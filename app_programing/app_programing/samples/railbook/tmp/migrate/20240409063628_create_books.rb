class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :isbn, limit: 17, null: false
      t.string :title, limit: 100, null: false
      t.decimal :price, precision: 5, scale: 0
      t.string :publisher, limit: 20, default: '技術評論社'
      t.date :published
      t.boolean :dl

      t.timestamps
    end
  end
end
