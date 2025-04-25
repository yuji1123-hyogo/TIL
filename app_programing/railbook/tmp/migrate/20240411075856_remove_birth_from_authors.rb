class RemoveBirthFromAuthors < ActiveRecord::Migration[7.1]
  def change
    remove_column :authors, :birth, :date
  end
end
