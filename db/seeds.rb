# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

puts 'CAR STYLE'
style = CarStyle.find_or_create_by_name :name => ENV['CAR_STYLE'].dup, :seat => ENV['SEAT'].dup
puts 'style: ' << style.name

puts 'Create Car'
car = Car.find_or_create_by_gps_name :way => 4, :plate => "1234", :gps_name => "gps1", :car_style_id => style.id

puts 'Create Station'
Station.create!([
                    {name: "1", lat: "13.842153", lng: "100.5763", station: 1, nextStation: 2, x1: "13.841877", y1: "100.576558", x2: "13.842545", y2: "100.576781", x3: "13.842727", y3: "100.574429", x4: "13.842045", y4: "100.574364"},
                    {name: "2", lat: "13.842473", lng: "100.572913", station: 2, nextStation: 3, x1: "13.842045", y1: "100.574364", x2: "13.842727", y2: "100.574429", x3: "13.842883", y3: "100.572268", x4: "13.84225", y4: "100.571542"},
                    {name: "3", lat: "13.843011", lng: "100.570862", station: 3, nextStation: 4, x1: "13.84225", y1: "100.571542", x2: "13.842757", y2: "100.572114", x3: "13.843663", y3: "100.570671", x4: "13.843263", y4: "100.569821"},
                    {name: "4", lat: "13.84375", lng: "100.570217", station: 4, nextStation: 5, x1: "13.843263", y1: "100.569821", x2: "13.843663", y2: "100.570671", x3: "13.845081", y3: "100.570875", x4: "13.845107", y4: "100.570015"},
                    {name: "5", lat: "13.845816", lng: "100.570498", station: 5, nextStation: 6, x1: "13.845107", y1: "100.570015", x2: "13.845081", y2: "100.570875", x3: "13.846556", y3: "100.570976", x4: "13.846685", y4: "100.570051"},
                    {name: "6", lat: "13.847107", lng: "100.57065", station: 6, nextStation: 7, x1: "13.846685", y1: "100.570051", x2: "13.846556", y2: "100.570976", x3: "13.8483", y3: "100.571022", x4: "13.848392", y4: "100.570086"},
                    {name: "7", lat: "13.849097", lng: "100.570607", station: 7, nextStation: 8, x1: "13.848392", y1: "100.570086", x2: "13.8483", y2: "100.571022", x3: "13.849916", y3: "100.570973", x4: "13.85009", y4: "100.570041"},
                    {name: "8", lat: "13.850678", lng: "100.570605", station: 8, nextStation: 9, x1: "13.85009", y1: "100.570041", x2: "13.849916", y2: "100.570973", x3: "13.851849", y3: "100.571", x4: "13.853217", y4: "100.57004"},
                    {name: "9", lat: "13.852614", lng: "100.570852", station: 9, nextStation: 10, x1: "13.853217", y1: "100.57004", x2: "13.851849", y2: "100.571", x3: "13.851873", y3: "100.571548", x4: "13.853175", y4: "100.571557"},
                    {name: "10", lat: "13.852618", lng: "100.571964", station: 10, nextStation: 11, x1: "13.853175", y1: "100.571557", x2: "13.851873", y2: "100.571548", x3: "13.851874", y3: "100.572172", x4: "13.853291", y4: "100.573042"},
                    {name: "11", lat: "13.852176", lng: "100.572668", station: 11, nextStation: 12, x1: "13.853291", y1: "100.573042", x2: "13.851874", y2: "100.572172", x3: "13.850763", y3: "100.572183", x4: "13.850827", y4: "100.57299"},
                    {name: "12", lat: "13.849942", lng: "100.572677", station: 12, nextStation: 13, x1: "13.850827", y1: "100.57299", x2: "13.850763", y2: "100.572183", x3: "13.849078", y3: "100.572176", x4: "13.849022", y4: "100.572989"},
                    {name: "13", lat: "13.847935", lng: "100.572656", station: 13, nextStation: 14, x1: "13.849022", y1: "100.572989", x2: "13.849078", y2: "100.572176", x3: "13.846207", y3: "100.57215", x4: "13.846225", y4: "100.572949"},
                    {name: "14", lat: "13.844897", lng: "100.572597", station: 14, nextStation: 15, x1: "13.846225", y1: "100.572949", x2: "13.846207", y2: "100.57215", x3: "13.844229", y3: "100.572098", x4: "13.843647", y4: "100.572784"},
                    {name: "15", lat: "13.842986", lng: "100.571957", station: 15, nextStation: 2, x1: "13.843647", y1: "100.572784", x2: "13.844229", y2: "100.572098", x3: "13.843117", y3: "100.571547", x4: "13.842758", y4: "100.572113"}
                ])