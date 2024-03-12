# This file should ensure the existence of records required to run the application in every environment (serviceion,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

Order.destroy_all
LineItem.destroy_all
Service.destroy_all
User.destroy_all

puts "######################## Creando Usuarios ########################"

cart1 = Cart.create!
cart2 = Cart.create!

user1 = User.new(email: "cristopher@gmail.com",
                 password: "123456",
                 first_name: "Cristopher",
                 last_name: "Odreman",
                 phone: "+584143007592",
                 dni: "V-26809655",
                 nationality: "Venezolano",
                 address: "Av Caracas, Caracas")
file = URI.open("https://avatars.githubusercontent.com/u/134723849?v=4")
user1.photo.attach(io: file, filename: "cristopher.png", content_type: "image/png")
user1.save!

puts "Usuario Cristopher creado"

user2 = User.new(email: "genesis@gmail.com",
                 password: "123456",
                 first_name: "Genesis",
                 last_name: "Rodriguez",
                 phone: "+584127435309",
                 dni: "V-27439500",
                 nationality: "Venezolano",
                 address: "Av Bolivar, Caracas")
file = URI.open("https://avatars.githubusercontent.com/u/107373693?v=4")
user2.photo.attach(io: file, filename: "genesis.png", content_type: "image/png")
user2.save!

puts "Usuario Genesis creado"

user3 = User.new(email: "javier@gmail.com",
                 password: "123456",
                 first_name: "Javier",
                 last_name: "Galviz",
                 phone: "+584123929514",
                 dni: "V-28324849",
                 nationality: "Chileno",
                 address: "Los Teques, Miranda")
file = URI.open("https://avatars.githubusercontent.com/u/123475777?v=4")
user3.photo.attach(io: file, filename: "javier.png", content_type: "image/png")
user3.save!

puts "Usuario Javier creado"

user4 = User.new(email: "jose@gmail.com",
                 password: "123456",
                 first_name: "Jose",
                 last_name: "Carrillo",
                 phone: "+584261041646",
                 dni: "V-24042798",
                 nationality: "Venezolano",
                 address: "Los Teques, Miranda")
file = URI.open("https://avatars.githubusercontent.com/u/64622223?v=4")
user4.photo.attach(io: file, filename: "jose.png", content_type: "image/png")
user4.save!

puts "Usuario Jose creado"

puts "######################## Creando Productos ########################"

service1 = Service.new(service_type: "Fullday",
                       title: "Cayo Sombrero",
                       price: 150,
                       rating: 0,
                       description: "Cayo Sombrero es el nombre de una isla del mar Caribe que pertenece al parque nacional Morrocoy, Es la isla más grande después de Punta Brava y una de las islas más populares del parque nacional. Posee una superficie aproximada de 35 hectáreas o 0,35 kilómetros cuadrados por lo que tiene una superficie un poco más pequeña que la Ciudad del Vaticano. Cuenta con dos playas grandes y un bosque de palmeras que ofrece sombra natural. Es equidistante de las poblaciones de Tucacas y Chichiriviche. Se encuentra en la parte más oriental del parque nacional Morrocoy, cerca de Cayo Pescadores y Playa Mayoral.",
                       address: "Cayo Sombrero municipio Silva Tucacas Falcón",
                       latitude: "10,883523",
                       longitude: "-68,209566",
                       date: "2024/10/23",
                       user_id: user2.id)
photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194013/development/3z1mvoc0ugnpu7ru8e7lcvqhcyvq.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194014/development/oy4m4plifqf66lls1p1uon9h3vp0.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194015/development/0bkkvvdro3be1egesdndh29rofu5.png",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194016/development/3or2rk02lv7ahpw3ekcd3b1472jb.jpg"
]
photo_urls.each do |url|
  service1.photos.attach(io: url, filename: "service1.jpg")
end

service1.save!

puts "#{service1.service_type} #{service1.title} Creado"

service2 = Service.new(service_type: "Fullday",
                       title: "Medanos de Coro",
                       price: 80,
                       rating: 0,
                       description: "El Parque Nacional Los Médanos de Coro es un parque nacional ubicado en el estado Falcón que abarca la jurisdicción de los municipios Miranda, Colina y Falcón, en el noroeste de Venezuela. Su área más importante está circunscrita alrededor del istmo, en la vía a la Península de Paraguaná. El istmo comprende una franja de 30 km de largo por 5 km de ancho, al sur de la franja se encuentra el parque nacional con 808,66 kilómetros de distribución abarcando todo el norte de la ciudad de Santa Ana de Coro ciudad declarara patrimonio de la humanidad.",
                       address: "Medanos de Coro, Estado Falcón, Venezuela",
                       latitude: "11,035275",
                       longitude: "-68,404183",
                       date: "2024/10/4",
                       user_id: user2.id)

photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194022/development/axvwp7y89h7p0au8bct0pa36doz9.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194019/development/8t37r1w67sdqooz55luom41v4dr4.webp",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194020/development/fbuzivtp2xkze4fm3ov4j92fto75.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194021/development/6cqllvwqfob1iae6pduabinp4eui.jpg"
]
photo_urls.each do |url|
  service2.photos.attach(io: URI.open(url), filename: "service2.jpg")
end

service2.save!

puts "#{service2.service_type} #{service2.title} Creado"

service3 = Service.new(service_type: "Fullday",
                       title: "Parque Nacional Mochima",
                       price: 140,
                       rating: 0,
                       description: "El Parque Nacional Mochima está ubicado en la región fisiográfica de la Cadena Oriental de la Cordillera de la Costa. Incluye una región marino costera e insular donde se encuentran playas, golfos, bahías y ensenadas de gran belleza escénica e importantes fondos marinos, con presencia de comunidades de coral de gran riqueza y diversidad biológica.",
                       address: "Parque Nacional Mochima Venezuela",
                       latitude: "10.346384",
                       longitude: "-64.340658",
                       date: "2024/07/23",
                       user_id: user2.id)

photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194028/development/r4vqo77p8jdenjbss5m0k2aods1b.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194025/development/xkexbg7df01mqkdtetg858h23nmk.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194026/development/h21pec3gv8tgor5t9gvwda3wfhoz.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194027/development/pa6gvgrqgmap4euf9u89x8jn4men.jpg"
]

photo_urls.each do |url|
  service3.photos.attach(io: URI.open(url), filename: "service3.jpg")
end

service3.save!

puts "#{service3.service_type} #{service3.title} Creado"

service4 = Service.new(service_type: "Fullday",
                       title: "Parque Nacional El Avila",
                       price: 50,
                       rating: 0,
                       description: "El Parque Nacional El Ávila llamado también como Parque Nacional Waraira Repano, es el mayor parque de la ciudad de Caracas además de su principal fuente de oxígeno. Fuente de inspiración para poetas y artistas, es un sitio de esparcimiento que fue creado en diciembre del año 1958 debido al notable crecimiento de la ciudad. El Parque Nacional El Ávila es uno de los lugares preferidos durante las mañanas o atardeceres, por los residentes, para caminar, escalar y relajarse en medio de un bellísimo paisaje natural. Por otra parte, podrás llegar a la cima del monte Ávila mediante el teleférico o visitar el pueblo de Galipán, donde disfrutarás de sus restaurantes y cafeterías, utilizando vehículos rústicos personales. El parque cubre unas 85.000 hectáreas y alberga importantes picos como por ejemplo la Silla de Caracas; el pico Humboldt (2159 mts.), el Naiguatá (2.765 mts.), el topo Galindo (2.600 mts.); el topo Goering (2.460 mts.), entre otros.",
                       address: "Parque Nacional el Ávila, Caracas, Venezuela",
                       latitude: "10,557388",
                       longitude: "-66,860008",
                       date: "2024/07/6",
                       user_id: user2.id)

photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194032/development/yillye1wh44a0dy51ycpq2avkgyh.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194030/development/efzs9k4s0xqz4x9nawuh9smndcs7.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194031/development/yd30epyltqbyni6ro5yfqxpj8006.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194035/development/g5qi9opjrcg71jul80ltq98ki28o.jpg"
]

photo_urls.each do |url|
  service4.photos.attach(io: URI.open(url), filename: "service4.jpg")
end

service4.save!

puts "#{service4.service_type} #{service4.title} Creado"

service5 = Service.new(service_type: "Fullday",
                       title: "Vereda del lago de Maracaibo",
                       price: 35,
                       rating: 0,
                       description: "El pulmón vegetal más grande de Maracaibo, el parque Vereda del Lago día y noche se convierte en una mini ciudad recreativa con opciones para hacer deporte y disfrutar con familiares y amigos. Anualmente, 500 mil personas visitan al parque Vereda del Lago, el pulmón vegetal más grande de Maracaibo donde además de practicar deporte, se mantiene contacto con la naturaleza, la promoción del arte, la cultura y el desarrollo económico.",
                       address: "Av el milagro, cerca de la Universidad, Maracaibo, Zulia",
                       latitude: "10,663100",
                       longitude: "-71,594261",
                       date: "2024/09/23",
                       user_id: user2.id)

photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194040/development/hi1c8onbtjn394qv1jn13xr7c8x5.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194038/development/3c6i1rx3bgclupvng6zz1q7cksd6.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194039/development/oor1k6zqpt98x5izkprsvmo6dkvw.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194038/development/3c6i1rx3bgclupvng6zz1q7cksd6.jpg"
]

photo_urls.each do |url|
  service5.photos.attach(io: URI.open(url), filename: "service5.jpg")
end

service5.save!

puts "#{service5.service_type} #{service5.title} Creado"

service6 = Service.new(service_type: "Fullday",
                       title: "Brinca Este",
                       price: 30,
                       rating: 0,
                       description: "Somos el Parque de Trampolines más grande de Caracas. Nuestro objetivo es llevar la diversión de nuestros visitantes a otro nivel, donde el entretenimiento e imaginación los llevará a brincar tan alto como lo sueñen. En horario de martes de jueves de 11:00 de la mañana hasta las 8:00 de la noche, mientras que de viernes a domingo abre sus puertas hasta las 9:00 de la noche. Para las atracciones en el área de piscinas, trampolines y ninja park el peso máximo es de 150 kilos y la edad límite es de 65 años, el uso es bajo el riesgo de cada usuario. Son 2.100 metros cuadrados.",
                       address: "Eugenio Mendoza Con Calle Urdaneta, Caracas",
                       latitude: "10,489473",
                       longitude: "-66,826347",
                       date: "2024/12/5",
                       user_id: user2.id)

photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194062/development/ru0mgvn3iv798avjczg6wb66tq0j.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194063/development/t614ai9aj1c16kv6vwan3baeh587.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194064/development/qiwjd00chk7x65k7wrg5n29sxf78.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194065/development/m9o9c0cpg757vkczqgi1qa28afs1.jpg"
]

photo_urls.each do |url|
  service6.photos.attach(io: URI.open(url), filename: "service6.jpg")
end

service6.save!

puts "#{service6.service_type} #{service6.title} Creado"

service7 = Service.new(service_type: "Fullday",
                       title: "Colonia Tovar",
                       price: 80,
                       rating: 0,
                       description: "La Colonia Tovar es una ciudad venezolana, capital del Municipio Tovar, en el Estado Aragua. Fue fundada el 8 de abril de 1843 por un grupo de inmigrantes alemanes provenientes del entonces Gran Ducado de Baden (luego incorporado a Alemania). Se caracteriza por mantener la impronta cultural de su origen, por lo que es llamada «la Alemania del Caribe» o «El Pueblo Alemán de Venezuela».",
                       address: "Colonia Tovar, Estado Aragua, Venezuela",
                       latitude: "10,374700",
                       longitude: "-67,323530",
                       date: "2024/05/05",
                       user_id: user1.id)

photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948552/development/152spukzqdd3zrbjb5pgym9p6aap.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948553/development/fr4iy0d7gqhtivbafhqf3f2y83b7.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948555/development/rthniauq5lrwmcnftossrpacsu2m.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948556/development/9jna04l5bbfayxz67o4o9tg7iq62.jpg"
]

photo_urls.each do |url|
  service7.photos.attach(io: URI.open(url), filename: "service7.jpg")
end

service7.save!

puts "#{service7.service_type} #{service7.title} Creado"

service8 = Service.new(service_type: "Fullday",
                       title: "Dunas Parque Acuático",
                       price: 60,
                       rating: 0,
                       description: "Ubicado en la Ciudad de Valencia, Municipio Naguanagua del Estado Carabobo, El parque acuático incluye múltiples atracciones entre ellas Aquacity, Go Karts, vive el Vértigo en la montaña rusa full adrenalina, el bosque encantado, golfito, zona infantil y mucho más, ven al Parque Dunas y pasa un día diferente de entretenimiento familiar. Horario Diurno: Viernes, Sábados y Domingos: 09:00 am a 04:00 pm / Horario Nocturno: Viernes, Sábados y Domingos: 5:00 pm a 11:00 pm",
                       address: "Avenida Principal, Edificio Parque Dunas, Local 175-505, Urbanización Mañongo, Valencia, Estado Carabobo ",
                       latitude: "10,214940",
                       longitude: "-67,994919",
                       date: "2024/07/12",
                       user_id: user1.id)

photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194073/development/a4u7fr8934yb1nt5poel6obovv7c.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194070/development/z9y90r0xb2jerij55gujamqglham.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194071/development/7s1eutaoz2z177zzcd2de7s6zbfs.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1710194072/development/mpqqzzuzfgxrpdxcngxgj01glu5m.jpg"
]

photo_urls.each do |url|
  service8.photos.attach(io: URI.open(url), filename: "service8.jpg")
end

service8.save!

puts "#{service8.service_type} #{service8.title} Creado"

service9 = Service.new(service_type: "Fullday",
                       title: "Viaja al Salto Angel",
                       price: 500,
                       rating: 0,
                       description: "Viajar al Salto Ángel en el Parque Nacional Canaima es una aventura que te llenara de vida. Canaima es una de las principales atracciones de Venezuela, es la única laguna donde se unen cinco saltos, aquí se encontraras la caída de agua más alta del mundo. Auyan-tepuy o Auyantepuy (En lengua pemón 'Montaña Del Diablo'), Es el tepuy más grande y famoso de Venezuela. Desde su cima nace la cascada más grande del mundo, con una altura de 979 metros es 15 veces más grande que las Cataratas del Niágara y tres veces más grande que la Torre Eiffel, en París.",
                       address: "Parque Nacional Canaima, en el estado Bolívar, Venezuela.",
                       latitude: "5,970056",
                       longitude: "-62,536220",
                       date: "2024/08/30",
                       user_id: user1.id)

photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948582/development/0jhg1gu0fa5jjlhzrwzjt52i0wwm.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948583/development/o1mm9hx6pplvzy4t182fv4yt5l97.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948591/development/r9ims00h8legdy3ugsvrvknp6l0q.png",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948592/development/159dwi8wf3wehdpjrfz0f4z32njp.jpg"
]

photo_urls.each do |url|
  service9.photos.attach(io: URI.open(url), filename: "service9.jpg")
end

service9.save!

puts "#{service9.service_type} #{service9.title} Creado"

service10 = Service.new(service_type: "Fullday",
                        title: "Parque La Llovizna",
                        price: 350,
                        rating: 0,
                        description: "El Parque Nacional La Llovizna es un lugar mágico donde el visitante puede sentir la energía del agua en todo su esplendor. Está ubicado al sur de Venezuela, en Ciudad Guayana, muy cerca de Puerto Ordaz, en el Estado Bolívar. El parque tiene una extensión de 200 hectáreas y está conformado por islas y saltos de una belleza impresionante. Si quieres conocer a Venezuela a través de un paisaje sinigual, La Llovizna es perfecto.",
                        address: "Avenida Leopoldo Sucre Figarella, Ciudad Guayana, Guayana Region",
                        latitude: "8,329123",
                        longitude: "-62,660648",
                        date: "2024/06/23",
                        user_id: user1.id)

photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948600/development/t3mbh5nohu43q175fyxvgrmnj9wx.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948602/development/jqpuv3sa0kum77thlckrhi0rlt2e.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948604/development/1gagf7q2k9t2ts8aizxzqn5tuos8.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948606/development/8njnfp011ffkjyl2h21kyxoi6xe0.jpg"
]

photo_urls.each do |url|
  service10.photos.attach(io: URI.open(url), filename: "service10.jpg")
end

service10.save!

puts "#{service10.service_type} #{service10.title} Creado"

service11 = Service.new(service_type: "Fullday",
                        title: "La Venezuela de Antier",
                        price: 65,
                        rating: 0,
                        description: "En la vía a Jají desde Ciudad de Merida, se encuentra uno de los parques temáticos de Merida: 'La Venezuela de Antier'. El tema de este parque es la Venezuela de los años 20 cuando entonces gobernaba el benemérito Juan Vicente Gomez. El recorrido comienza en la estación principal (donde se encuentra el estacionamiento.) se compran las entradas y se toma unos tranvías de la antigua Caracas hasta llegar al parque. Al llegar a la primera estación somos recibidos por un Coronel, quien crea un ambiente que involucra a los visitantes en el tema del parque. Tras la llegada las primeras atracciones son: Un pequeño museo con antiguedades, La Cueva del Guacharo (donde hay una muestra de la misma) y Nueva Esparta (donde se puede participar en un espectáculo donde se rescatan las tradiciones de La Isla de Margarita, el cual esta hecho con mucho humor).",
                        address: "Carretera Panamericana vía Jají - La Azulita, 5101 Mérida",
                        latitude: "8,593546",
                        longitude: "-71,233902",
                        date: "2024/06/5",
                        user_id: user1.id)

photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948612/development/45a16062stzj3mnij6tuvzmjl7y0.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948614/development/3pda4yi3d1k2w2zaptb4hs7j2udj.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948616/development/yfr5my0cer8fbsnnz4vtq6ywlkfs.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948619/development/h5800x876yzf462jw7hhx4ge8xa6.jpg"
]

photo_urls.each do |url|
  service11.photos.attach(io: URI.open(url), filename: "service11.jpg")
end

service11.save!

puts "#{service11.service_type} #{service11.title} Creado"


service12 = Service.new(service_type: "Fullday",
                        title: "Parque El Agua",
                        price: 20,
                        rating: 0,
                        description: "En este parque se encuentra el tobogán más alto de Venezuela, de 18 metros, el Churún Merú. Todos los toboganes del parque tienen nombres indígenas y Churún Merú, el nombre indígena del 'Salto Angel', es apropiado para este tobogán, solo apto para los más osados. Pero, en el Parque el Agua, hay para todos los gustos. Además del Churún Merú, hay cuatro toboganes con distintos niveles de emoción.",
                        address: "31 Av. 31 de Julio Barco de Ent a Parque el Agua, Porlamar, Isla de Margarita",
                        date: "",
                        user_id: user1.id)

photo_urls = [
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948627/development/b6v8sbf1t7a0u98g1qylivtxvu3j.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948629/development/1k5tk9a7qiocwdv739ej9gzeth3x.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948631/development/wxebbkboh5ngq4r3ibkb8vn8ttyy.jpg",
  "https://res.cloudinary.com/dden4e24f/image/upload/v1709948633/development/9dpcbjlib91plq8lj6xymfn67ayu.jpg"
]

photo_urls.each do |url|
  service12.photos.attach(io: URI.open(url), filename: "service12.jpg")
end

service12.save!

puts "#{service12.service_type} #{service12.title} Creado"

puts "######################## Creando Line_Items ########################"

line_item1 = LineItem.create!(cart: cart1, service: service1, qtty: 1)
line_item1.price = (line_item1.service.price * line_item1.qtty)

line_item2 = LineItem.create!(cart: cart1, service: service7, qtty: 2)
line_item2.price = (line_item2.service.price * line_item2.qtty)

line_item3 = LineItem.create!(cart: cart1, service: service4, qtty: 1)
line_item3.price = (line_item3.service.price * line_item3.qtty)

line_item4 = LineItem.create!(cart: cart2, service: service2, qtty: 1)
line_item4.price = (line_item4.service.price * line_item4.qtty)

line_item5 = LineItem.create!(cart: cart2, service: service3, qtty: 1)
line_item5.price = (line_item5.service.price * line_item5.qtty)

puts "Creados Line_Items"

puts "######################## Creando Orden ########################"

order1 = Order.create!(date: Date.today, total_price: line_item1.price + line_item2.price + line_item3.price, user: user3, payment_method: "TDC")

line_item1.order = order1
line_item1.update(cart_id: nil)
line_item2.order = order1
line_item2.update(cart_id: nil)
line_item3.order = order1
line_item3.update(cart_id: nil)

cart1.destroy!

puts "Orden Creada"
