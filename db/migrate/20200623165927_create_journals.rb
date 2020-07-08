class CreateJournals < ActiveRecord::Migration[6.0]
  def change
    create_table :journals do |t|
      t.string :entry
      t.references :user, foreign_key: true
      t.string :entryDate

      t.timestamps
    end
  end
end
