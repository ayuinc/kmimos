# Estructura para crear combos countries => states => cities (en bd se llama location)
# Nota: Alguien creo un campo llamado utf_names => debería ser eliminado no tiene uso y sólo repite el nombre de la ciudad

countries = [{
  name: "México",
  locale: "es-MX",
  currency: "MXN $",
  phone: '+55 1791 4931 / 55 6578 6147',
  facebook:'https://www.facebook.com/pages/Kamimos/1473614136234432?ref=bookmarks',
  twitter: 'https://twitter.com/KmimosMx',
  flag: 'mexico',
  domain: 'mx.kmimos.la',
  dni_length: 13,
  dni_label: 'IFE',
  states: [{
    name: "Distrito Federal",
    cities: ["Xochimilco", "Tlalpan", "Tláhuac", "Magdalena Contreras", 
             "Milpa Alta", "Miguel Hidalgo", "Venustiano Carranza", "Iztapalapa", 
             "Iztacalco", "Gustavo A. Madero", "Cuauhtémoc", "Coyoacán", 
             "Cuajimalpa de Morelos", "Benito Juárez", "Azcapotzalco", "Álvaro Obregón"]
  },{
    name: "Estado de México",
    cities: ["Texcoco", "Acolman", "Coacalco", "Toluca", "Tlalnepantla", "Naucalpan", 
             "Metepec", "Cuautitlan Izcalli", "Cuautitlan ", "Atizapán"]
  },{
    name: "Jalisco",
    cities: ["Guadalajara","Zapopan"]
  },{
    name: "Nuevo León",
    cities: ["Escobedo", "San Pedro", "San Nicolas de los Garza", "Monterrey"]
  }]
},{
  name: "Argentina",
  locale: "es-AR",
  currency: "ARS $",
  phone: '+55 1791 4931 / 55 6578 6147',
  facebook:'https://www.facebook.com/pages/Kamimos/1473614136234432?ref=bookmarks',
  twitter: 'https://twitter.com/KmimosMx',
  flag:'argentina',  
  domain: 'ar.kmimos.la',
  dni_length: 8,
  dni_label: 'DNI',
  states: [{
    name: "Buenos Aires",
    cities: ["Agronomía","Almagro","Balvanera","Barracas","Belgrano","Boedo",
             "Caballito","Chacarita","Coghlan","Colegiales","Constitución",
             "Flores","Floresta","La Boca","La Paternal","Liniers","Mataderos",
             "Monte Castro","Montserrat","Nueva Pompeya","Nuñez","Palermo",
             "Parque Avellaneda","Parque Chacabuco","Parque Chas","Parque Patricios",
             "Puerto Madero","Recoleta","Retiro","Saavedra","San Cristóbal",
             "San Nicolás","San Telmo","Versalles","Villa Crespo","Villa Devoto",
             "Villa General Mitre","Villa Lugano","Villa Luro","Villa Ortúzar",
             "Villa Pueyrredón","Villa Real","Villa Riachuelo","Villa Santa Rita",
             "Villa Soldati","Villa Urquiza","Villa del Parque","Vélez Sarsfield"]
  }]
},{
  name: "Panamá",
  locale: "es-PA",
  currency: "PAN B/.",
  phone: '+507 62453172',
  facebook:'https://www.facebook.com/pages/Kamimos/1473614136234432?ref=bookmarks',
  twitter: 'https://twitter.com/KmimosMx',
  flag:'panama',
  domain: 'pa.kmimos.la',
  dni_length: 12,
  dni_label: 'ID',
  states: [{
    name: "Ciudad de Panamá",
    cities: ["San Francisco","Costa del Este","Punta Paitilla","Punta Pacifica",
             "El Cangrejo","Marbella","Bella Vista","Obarrio","Avenida Balboa",
             "El Dorado","Vía España","Costa Sur","Versalles","Albrook","Clayton",
             "Coco del Mar","Altos del Golf","Campo Lindberg","Brisas del Golf",
            "12 de Octubre","Rio Abajo"]
  }]
}]

countries.each do |country|
  c = Country.find_or_initialize_by(name: country[:name])
  c.name = country[:name]
  c.locale = country[:locale]
  c.currency = country[:currency]
  c.phone = country[:phone]
  c.facebook = country[:facebook]
  c.twitter = country[:twitter]
  c.flag = country[:flag]
  c.domain = country[:domain]
  c.dni_length = country[:dni_length]
  c.dni_label = country[:dni_label]
  c.save
  
  country[:states].each do |state|
    s = State.find_or_initialize_by(name: state[:name])
    s.name = state[:name]
    s.country_id = c.id
    s.save
    
    state[:cities].each do |city|
      l = Location.find_or_initialize_by(name: city)
      l.name = city
      l.utf_name = city
      l.state_id = s.id
      l.save
      
    end
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

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')