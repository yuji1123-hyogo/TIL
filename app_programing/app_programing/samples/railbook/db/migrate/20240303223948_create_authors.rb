class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :birth
      t.text :address

      t.timestamps
    end
  end
end
