class AddGoalToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :goal, :string
  end
end
