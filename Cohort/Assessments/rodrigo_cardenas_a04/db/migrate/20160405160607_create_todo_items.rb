class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :body
      t.boolean :completed, default: false
      t.integer :todo_list_id, index: true
      t.timestamps null: false
    end
  end
end
