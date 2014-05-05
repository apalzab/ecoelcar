# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vehicles = Vehicle.create([
  # {user_id: 1, brand: 'Audi', model: 'a3', horse_power: '120', year_of_registration: '2001', seats: '5'},
  # {user_id: 1, brand: 'Volvo', model: 'c240', horse_power: '240', year_of_registration: '2012', seats: '5'},
  # {user_id: 1, brand: 'Volkswagen', model: 'golf', horse_power: '180', year_of_registration: '2007', seats: '5'},
  # {user_id: 1, brand: 'Audi', model: 'a3', horse_power: '120', year_of_registration: '2001', seats: '5'},
  # {user_id: 2, brand: 'Audi', model: 'a3', horse_power: '120', year_of_registration: '2001', seats: '5'},
  # {user_id: 2, brand: 'Audi', model: 'a3', horse_power: '120', year_of_registration: '2001', seats: '5'},
  # {user_id: 2, brand: 'Audi', model: 'a3', horse_power: '120', year_of_registration: '2001', seats: '5'},
])

# stations = Station.create([
#   { name: 'Deusto', latlng: '43.271674,-2.939186' },
#   { name: 'Bilbao, Plaza de Toros', latlng: '43.256076,-2.936454' },
#   { name: 'Bilbao, Ametzola (calle Gordoniz)', latlng: '43.255033,-2.943980' },
#   { name: 'Bilbao, Begoña (calle Zabalbide)', latlng: '43.261919,-2.911929' },
#   { name: 'Barakaldo (Herriko Plaza)', latlng: '43.297350,-2.986217' },
#   { name: 'Getxo (calle Zarrenebarri)', latlng: '43.341034,-3.003918' },
#   { name: 'Las Arenas (calle Novia Salcedo)', latlng: '43.323585,-3.013523' },
#   { name: 'Portugalete (calle General Castaños)', latlng: '43.322706,-3.025191' },
# ])


paths = Path.create([
  { user_id: 1, origin_station_id: 2, destination_station_id: 3, datetime: Time.now.tomorrow },
  { user_id: 1, origin_station_id: 2, destination_station_id: 3, datetime: Time.now.tomorrow+1 },
  { user_id: 1, origin_station_id: 2, destination_station_id: 3, datetime: Time.now.tomorrow+1 },
  { user_id: 1, origin_station_id: 2, destination_station_id: 3, datetime: Time.now.tomorrow+2 },
])