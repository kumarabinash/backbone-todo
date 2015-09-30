class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task
      t.string :status
      t.string :priority

      t.timestamps null: false
    end
  end
end
