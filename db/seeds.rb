# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
locations = [
 "Xochimilco", "Venustiano Carranza", "Tlalpan", "Tláhuac", "Milpa Alta", "Miguel Hidalgo", "La Magdalena Contreras", "Iztapalapa", "Iztacalco", "Gustavo A. Madero", "Cuauhtémoc", "Cuajimalpa de Morelos", "Coyoacán", "Benito Juárez", "Azcapotzalco", "Alvaro Obregón"]

locations.sort!.each do |location|
  Location.find_or_create_by(name: location)
end

categories = ["Mantenimiento", "Asistente Personal", "Limpieza", "Mudanza"]

categories.sort!.each do |category|
  Category.find_or_create_by(name: category)
end
