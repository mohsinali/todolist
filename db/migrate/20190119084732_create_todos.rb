class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.text :title
      t.boolean :is_completed, default: false
      
      t.timestamps
    end
  end
end
