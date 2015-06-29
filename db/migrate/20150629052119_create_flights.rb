class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :startair
      t.references :endair

      t.datetime :startflight
      t.integer :duration


      t.timestamps null: false
    end
  end
end
