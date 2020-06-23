class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :todo
      t.boolean :is_completed, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
