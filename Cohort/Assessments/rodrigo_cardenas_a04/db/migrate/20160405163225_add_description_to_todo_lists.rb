class AddDescriptionToTodoLists < ActiveRecord::Migration
  def change
    add_column :todo_lists, :description, :string
  end
end
