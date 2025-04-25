class ChangeBooks < ActiveRecord::Migration[7.1]
  def change
    change_table :books do |t|
      t.string :author
      t.remove :published, :dl
      t.index :title
      t.rename :isbn, :isbn_code
    end
  end
end
