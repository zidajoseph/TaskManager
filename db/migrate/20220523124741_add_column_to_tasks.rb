class AddColumnToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :status, :integer
    add_column :tasks, :priority, :integer
  end
end
