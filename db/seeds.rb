# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vehicles = Vehicle.create([
  {user_id: 1, brand: 'Audi', model: 'a3', horse_power: '120', year_of_registration: '2001', seats: '5'},
  # {user_id: 1, brand: 'Volvo', model: 'c240', horse_power: '240', year_of_registration: '2012', seats: '5'},
  # {user_id: 1, brand: 'Volkswagen', model: 'golf', horse_power: '180', year_of_registration: '2007', seats: '5'},
  # {user_id: 1, brand: 'Audi', model: 'a3', horse_power: '120', year_of_registration: '2001', seats: '5'},
  # {user_id: 2, brand: 'Audi', model: 'a3', horse_power: '120', year_of_registration: '2001', seats: '5'},
  # {user_id: 2, brand: 'Audi', model: 'a3', horse_power: '120', year_of_registration: '2001', seats: '5'},
  # {user_id: 2, brand: 'Audi', model: 'a3', horse_power: '120', year_of_registration: '2001', seats: '5'},
])
