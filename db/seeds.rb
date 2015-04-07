# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
locations = [
 "Xochimilco", "Venustiano Carranza", "Tlalpan", "Tláhuac", "Milpa Alta", "Miguel Hidalgo", "La Magdalena Contreras", "Iztapalapa", "Iztacalco", "Gustavo A. Madero", "Cuauhtémoc", "Cuajimalpa de Morelos", "Coyoacán", "Benito Juárez", "Azcapotzalco", "Alvaro Obregón", "Querétaro", "Estado de Mexico", "Atizapán", "Cuautitlan", "Cuautitlan Izcalli", "Metepec", "Nuacalpan", "Tlalnepantla", "Toluca", "Zapopan", "Monterrey", "San Nicolas de los Garza", "San Pedro", "Escobedo"]

locations.sort!.each do |location|
  Location.find_or_create_by(name: location)
end

states = [
"Distrito Federal", "Estado de México", "Guadalajara", "Nuevo León"]

states.sort!.each do |state|
  State.find_or_create_by(name: state)
end

categories = ["Paseador", "Entrenador", "Veterinario", "Hotel"]

categories.sort!.each do |category|
  Category.find_or_create_by(name: category)
end


ages = ["Cachorros", "Adultos"]

ages.sort!.each do |age|
  Age.find_or_create_by(age_group_name: age)
end

sizes = ["Pequeños", "Medianos", "Grandes"]

sizes.sort!.each do |size|
  Size.find_or_create_by(size_title: size)
end

sizes = ["Pequeños", "Medianos", "Grandes"]

sizes.sort!.each do |size|
  Size.find_or_create_by(size_title: size)
end

properties = ["Casa", "Departamento"]

properties.sort!.each do |property|
  Property.find_or_create_by(property_name: property)
end