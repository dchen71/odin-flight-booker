# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Clear all entries in database
Flight.delete_all
Airport.delete_all   

Airport.create(code: 'SFO', city: 'San Francisco')
Airport.create(code: 'ICN', city: 'Incheon')
Airport.create(code: 'NRT', city: 'Narita')
Airport.create(code: 'AMS', city: 'Amsterdam')
Airport.create(code: 'BUD', city: 'Budapest')
Airport.create(code: 'JFK', city: 'New York')


#Rough duration time hash between places
duration = { "SFO_ICN" => 21.hours, "SFO_NRT" => 18.hours, "SFO_AMS" => 13.hours, "SFO_BUD" => 15.hours, "SFO_JFK" => 6.hours,
             "ICN_SFO" => 18.hours, "ICN_NRT" => 8.hours, "ICN_AMS" => 9.hours, "ICN_BUD" => 8.hours, "ICN_JFK" => 5.hours,
             "NRT_SFO" => 18.hours, "NRT_ICN" => 3.hours, "NRT_AMS" => 12.hours, "NRT_BUD" => 12.hours, "NRT_JFK" => 15.hours,
             "AMS_SFO" => 13.hours, "AMS_ICN" => 10.hours, "AMS_NRT" => 10.hours, "AMS_BUD" => 2.hours, "AMS_JFK" => 12.hours,
             "BUD_SFO" => 15.hours, "BUD_ICN" => 7.hours, "BUD_NRT" => 10.hours, "BUD_AMS" => 2.hours, "BUD_JFK" => 12.hours,
             "JFK_SFO" => 6.hours, "JFK_ICN" => 18.hours, "JFK_NRT" => 16.hours, "JFK_AMS" => 10.hours, "JFK_BUD" => 13.hours
             }


#Creates all the flight info between locales
Airport.all.each do |airport1|
  Airport.all.each do |airport2|
    unless airport1 == airport2
      dur = duration["#{airport1.code}_#{airport2.code}"]
      curr_time = Time.new.strftime('%H:%M:%S')
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_date: Time.now, 			start_time: Time.now.strftime('%H:%M:%S'), 					duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_date: Time.now, 			start_time: 3.hours.from_now.strftime('%H:%M:%S'), 			duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_date: Time.now, 			start_time: 6.hours.from_now.strftime('%H:%M:%S'), 			duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_date: 1.day.from_now, 	start_time: Time.now.strftime('%H:%M:%S'), 			duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_date: 1.day.from_now, 	start_time: 6.hours.from_now.strftime('%H:%M:%S'), duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_date: 2.days.from_now, 	start_time: Time.now.strftime('%H:%M:%S'), 			duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_date: 2.days.from_now,	start_time: 3.hours.from_now.strftime('%H:%M:%S'), duration: dur)
    end
  end
end