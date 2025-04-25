class AddAuthorToBooks < ActiveRecord::Migration[7.1]
  def change
    say 'Add page column to books table.'
    suppress_messages do
      add_column :books, :page, :integer
    end
  end
end
