class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :occurence, default: 0
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
