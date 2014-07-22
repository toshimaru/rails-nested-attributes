class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :task
      t.boolean :status

      t.timestamps
    end
  end
end
