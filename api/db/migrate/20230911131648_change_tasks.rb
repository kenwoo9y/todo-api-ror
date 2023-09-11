class ChangeTasks < ActiveRecord::Migration[7.0]
  def up
    change_column :tasks, :name, :string, limit: 30, null: false
  end

  def down
    change_column :tasks, :name, :string, null: false
  end
end
