class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :from_airport
      t.references :to_airport

      t.date :start_date
      t.time :start_time
      t.integer :duration

      t.timestamps null: false
    end
  end
end
