class CreateTodos < ActiveRecord::Migration[8.1]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.text :content
      t.boolean :completed, default: false, null: false
      t.date :due_date
      t.integer :priority, default: 1, null: false

      t.timestamps
    end
  end
end
