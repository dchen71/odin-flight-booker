class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :depart_airport_id
      t.integer :destin_airport_id

      t.date :start_date
      t.time :start_time
      t.integer :duration

      t.timestamps null: false
    end
  end
end
