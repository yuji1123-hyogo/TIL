class AddUserIdToTasks < ActiveRecord::Migration[7.1]
  def change
    def up
      execute 'DELTE FROM tasks'
      add_reference :tasks,:user,null: false ,index: true
    end

    def down
      remove_reference :tasks,:user,index: true
    end
  end
end
