class ChangeTodos < ActiveRecord::Migration
  def change
    change_column :todos, :status, :string, :default => "incomplete"
    change_column :todos, :priority, :string, :default => "normal"
  end
end
