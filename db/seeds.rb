# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
locations = [
   "Ancón",
   "Ate",
   "Barranco",
   "Bellavista",
   "Breña",
   "Carabayllo",
   "Carmen de la Legua Reynoso",
   "Cercado de Lima",
   "Chaclacayo",
   "Chorrillos",
   "Cieneguilla",
   "Comas",
   "El Agustino",
   "Independencia",
   "Jesús María",
   "La Molina",
   "La Perla",
   "La Punta",
   "La Victoria",
   "Lince",
   "Los Olivos",
   "Lurín",
   "Miraflores",
   "Magdalena del Mar",
   "Pueblo Libre",
   "Pachacámac",
   "Pucusana",
   "Pueblo Libre",
   "Puente Piedra",
   "Rímac",
   "San Borja",
   "San Isidro",
   "San Juan de Lurigancho",
   "San Juan de Miraflores",
   "San Luis",
   "San Martín de Porres",
   "San Miguel",
   "Santa Anita",
   "Santa Rosa",
   "Santiago de Surco",
   "Surquillo",
   "Ventanilla",
   "Villa El Salvador",
   "Villa María del Triunfo"
]

locations.sort!.each do |location|
  Location.find_or_create_by(name: location)
end

categories = [
   "Electricista",
   "Pintor",
   "Jardinero",
   "Gasfitero"]

categories.sort!.each do |category|
  Category.find_or_create_by(name: category)
end
