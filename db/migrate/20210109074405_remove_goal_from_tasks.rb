class RemoveGoalFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :goal, :string
  end
end
