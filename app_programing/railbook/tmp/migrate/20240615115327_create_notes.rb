class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes, primary_key: [ :isbn, :user_id ] do |t|
      t.string :isbn
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
