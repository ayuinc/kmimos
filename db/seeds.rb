states = {"Distrito Federal" => ["Xochimilco", "Tlalpan", "Tláhuac", "Magdalena Contreras", "Milpa Alta", "Miguel Hidalgo", "Venustiano Carranza", "Iztapalapa", "Iztacalco", "Gustavo A. Madero", "Cuauhtémoc", "Coyoacán", "Cuajimalpa de Morelos", "Benito Juárez", "Azcapotzalco", "Álvaro Obregón"], "Estado de México" => ["Texcoco", "Acolman", "Coacalco", "Toluca", "Tlalnepantla", "Nuacalpan", "Metepec", "Cuautitlan Izcalli", "Cuautitlan ", "Atizapán"], "Guadalajara" => ["Zapopan "], "Nuevo León" => ["Escobedo", "San Pedro", "San Nicolas de los Garza", "Monterrey"]}

states.each do |key, pair|
  State.find_or_create_by(name: key)
  state = State.find_by_name(key)
  pair.each do |location|
    Location.find_or_create_by(name: location, state_id: state.id)
  end
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

properties = ["Casa", "Departamento"]

properties.sort!.each do |property|
  Property.find_or_create_by(property_name: property)
end