class CreateRituals < ActiveRecord::Migration[6.0]
  def change
    create_table :rituals do |t|

      t.date :current_date
      t.boolean :is_done_for_the_day, defualt: false
      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end
