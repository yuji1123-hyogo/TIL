class ChangeTasksNameLimit30 < ActiveRecord::Migration[7.1]
  def change
    def up
      change_column :tasks,:name,:string,limit:30
    end
    def down
      change_column :tasks,:name,:string
    end
  end
end
