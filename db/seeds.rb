require "open-uri"

# puts "Cleaning Database"
# Attraction.delete_all
# puts "attractions clear"
# Community.delete_all
# puts "communites clear"
# Category.delete_all
# puts "category clear"
# Event.delete_all
# puts "events clean"
# City.delete_all
# puts "cities clear"
# User.delete_all
# puts "users clear"

# Chatroom.delete_all
# puts "Chatroom clear"

# puts "Creating users"

# users_data = [
#   { first_name: "Alexandre", last_name: "Almeida", email: "alex@lewagon.com", password: "123456", username: "alexthelion" },
#   { first_name: "Divya", last_name: "Savai", email: "divya@lewagon.com", password: "123456",username: "alexthelion" },
#   { first_name: "Christophe", last_name: "Deissenberg", email: "christophe@lewagon.com", password: "123456", username: "alexthelion" },
#   { first_name: "Karina", last_name: "Basurto", email: "kar@lewagon.com", password: "123456", username: "alexthelion" }
# ]

# users_data.map do |user_data|
#   User.create!(user_data)
# end
# puts 'Finished!'


# puts "Creating city"
# cities_data = [
#   { name: "Porto", description: "Porto is a fascinaating and vibrant city, entices with its historic center and sumptuous food and wine.", country: "Portugal" }
# ]
# cities_data.map do |city_data|
#   City.create!(city_data)
# end
# puts 'Finished!'


# puts "Creating attractions"
# attractions_data = [
#   { name: "Livraria Lello", description: "Porto’s most famous bookstore was built all the way back in 1906! The Lello brothers, who were running a bookstore at the time, hired the engineer Xavier Esteves to construct the Livraria Lello on Rua das Carmelitas.", address: " R. das Carmelitas 144, 4050-161 Porto, Portugal", opening_hours: "Monday-Sunday 9:00am -7:30pm", website_url: "https://www.livrarialello.pt/en/home",
#   latitude:41.1469, longitude: 8.6148},

#   { name: "Porto São Bento", description: "Porto São Bento Station is without a doubt the most beautiful train station in Portugal, and certainly one of the most beautiful in the world,we recommend that you see its beautiful atrium", address: "Praça de Almeida Garrett, 4000-069 Porto, Portugal", opening_hours: "Monday-Friday 8:00am-6:00pm, Saturday 9:00am-4:30pm, Sunday closed", website_url: "https://www.portugaltrains.com/porto-sao-bento-train-station.html", latitude: 41.1455, longitude: 8.6095},

#   { name: "Casa da Musica", description: "One of Porto’s leading cultural venues, designed by the architect, Rem Koolhaas.Home of the national Orchestra of Porto", address: " Av. da Boavista 604-610, 4149-071 Porto, Portugal", opening_hours: "Monday-Saturday 10:00am-7:00pm, Sunday 10:00am-6:00pm", website_url: "https://www.portugaltrains.com/porto-sao-bento-train-station.html",latitude: 41.1589,longitude: 8.6307},

#   { name: "The Clérigos tower", description: "The Clérigos Church is a Baroque church in the city of Porto, in Portugal. Its 75-meter-tall bell tower, the Torre dos Clérigos, can be seen from various points of the city and is one of its most characteristic symbols", address: " R. de São Filipe de Nery, 4050-546 Porto, Portugal", opening_hours: "Monday-Sunday 9:00am-7:00pm", website_url: "http://www.torredosclerigos.pt/en/", latitude: 41.1459, longitude: 8.6139}
#  ]

# attractions_data.map do |attraction_data|
#   attraction = Attraction.new(attraction_data)
#   attraction.city = City.first
#   attraction.save!
# end
# puts 'Finished!'


# puts "Creating community"

# communities_data = [
#   { name: "Brasilian", description: "This is our Brazilian community here on Culture Comb, Join this community and find events!"},
#   { name: "French", description: "This is our French community here on Culture Comb, Join this community and find events!"},
# ]
# communities_data.map do |community_data|
# community = Community.new(community_data)
# community.user = User.first
# community.city = City.first
# community.save!
# end
# puts 'Finished!'


# puts "Creating category"

# categories_data = [
#   { name: "Music"},
#   { name: "Art"},
#   { name: "Food"}
# ]
# categories_data.map do |category_data|
#   Category.create!(category_data)
# end
# puts 'Finished!'

# puts "Creating chatroom"

# Chatroom.create(name: "General")

# puts "Finished chatroom!"
# puts "Done! Heroku "


puts "Cleaning Database"
Attraction.delete_all
puts "attractions clear"
Community.delete_all
puts "communites clear"
FavoriteCategory.delete_all
puts "favorite categories clear"
Category.delete_all
puts "category clear"
Event.delete_all
puts "events clean"
City.delete_all
puts "cities clear"
User.delete_all
puts "users clear"

Chatroom.delete_all
puts "Chatroom clear"

puts "Creating users"

users_data = [
  {
    first_name: "Alexandre",
    last_name: "Almeida",
    email: "alex@lewagon.com",
    password: "123456",
    username: "alexthelion",
    nationality: "Brazilian",
    current_city: "Porto",
    photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1682538988/anspbresvpivccfpk9ul.jpg"
  },
  {
    first_name: "Divya",
    last_name: "Savai",
    email: "divya@lewagon.com",
    password: "123456",
    username: "divyadreamer",
    nationality: "Indian",
    current_city: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686904824/Divya_profile_cxh5m5.png"
  },
  {
    first_name: "Christophe",
    last_name: "Deissenberg",
    email: "christophe@lewagon.com",
    password: "123456",
    username: "cdeissenberg",
    nationality: "French",
    current_city: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686904824/Chris_profile_wnhuli.jpg"
  },
  {
    first_name: "Karina",
    last_name: "Basurto",
    email: "karina@lewagon.com",
    password: "123456",
    username: "karinab",
    nationality: "Mexican",
    current_city: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686904824/Kar_profile_kwsl9q.jpg"
  }
]

users_data.each do |user_data|
  user = User.create!(
    first_name: user_data[:first_name],
    last_name: user_data[:last_name],
    email: user_data[:email],
    password: user_data[:password],
    username: user_data[:username],
    nationality: user_data[:nationality],
    current_city: user_data[:current_city]
  )
    file = URI.open(user_data[:photo_url])
    user.photo.attach(io: file, filename: File.basename(user_data[:photo_url]), content_type: "image/png")
    user.save!
    puts "#{user.first_name} account created"
end


puts "Users created!"

puts "Creating cities"

cities_data = [
  {
    name: "Porto",
    description: "Porto is a fascinating and vibrant city, enticing with its historic center and sumptuous food and wine.",
    country: "Portugal",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686837563/development/766plnb1veyndw6oy777h03qqdnb.jpg"
  },
  {
    name: "Paris",
    description: "Paris, the City of Lights, is renowned for its romantic ambiance, iconic landmarks, and world-class art and cuisine.",
    country: "France",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686837564/development/r973jsih8050kb2jwlpw1r1okfgg.jpg"
  },
  {
    name: "Berlin",
    description: "Berlin, the cultural capital of Germany, combines a rich history with a vibrant arts scene and a thriving nightlife.",
    country: "Germany",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686837566/development/0tjsez649aw4grc3l6q1phyzdfh8.jpg"
  }
]

cities_data.each do |city_data|
  city = City.create!(
    name: city_data[:name],
    description: city_data[:description],
    country: city_data[:country],
  )
  file = URI.open(city_data[:photo_url])
  city.photo.attach(io: file, filename: File.basename(city_data[:photo_url]), content_type: "image/png")
  city.save!
  puts "#{city.name} created"
end
puts 'Cities created!'

puts "Creating communities"

communities_data = [
  {
    name: "Brazilian",
    description: "This is our Brazilian community here on Culture Comb. Join this community and find events!"
  },
  {
    name: "French",
    description: "This is our French community here on Culture Comb. Join this community and find events!"
  },
  {
    name: "American",
    description: "This is our American community here on Culture Comb. Join this community and find events!"
  },
  {
    name: "Italian",
    description: "This is our Italian community here on Culture Comb. Join this community and find events!"
  },
  {
    name: "Indian",
    description: "This is our Indian community here on Culture Comb. Join this community and find events!"
  },
  {
    name: "English",
    description: "This is our English community here on Culture Comb. Join this community and find events!"
  }
]

City.all.each do |city|
  international_communities = communities_data.sample(2)

  international_communities.each do |community_data|
    community = Community.new(community_data)
    community.user = User.first
    community.city = city
    community.save!
  end
end

puts "Communities created!"

puts "Creating category"

categories_data = [
  { name: "Music"},
  { name: "Art"},
  { name: "Food"}
]
categories_data.map do |category_data|
  Category.create!(category_data)
end
puts 'Categories Created!'

puts "Creating attractions"

attractions_data = [
  # Attractions in Porto
  {
    name: "Livraria Lello",
    description: "Porto’s most famous bookstore was built all the way back in 1906!",
    address: "R. das Carmelitas 144, 4050-161 Porto, Portugal",
    opening_hours: "Monday-Sunday 9:00am -7:30pm",
    website_url: "https://www.livrarialello.pt/en/home",
    city_name: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686855933/redcharlie-redcharlie1-vGbC6mOeUCw-unsplash_bsvfut.jpg"
  },
  {
    name: "Porto São Bento",
    description: "Porto São Bento Station is without a doubt the most beautiful train station in Portugal.",
    address: "Praça de Almeida Garrett, 4000-069 Porto, Portugal",
    opening_hours: "Monday-Friday 8:00am-6:00pm, Saturday 9:00am-4:30pm, Sunday closed",
    website_url: "https://www.portugaltrains.com/porto-sao-bento-train-station.html",
    city_name: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686855931/pedro-menezes-ij9Fm5ktg-I-unsplash_h8kb0c.jpg"
  },
  {
    name: "Casa da Musica",
    description: "One of Porto’s leading cultural venues, designed by the architect, Rem Koolhaas.",
    address: "Av. da Boavista 604-610, 4149-071 Porto, Portugal",
    opening_hours: "Monday-Saturday 10:00am-7:00pm, Sunday 10:00am-6:00pm",
    website_url: "https://www.portugaltrains.com/porto-sao-bento-train-station.html",
    city_name: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686855926/andy-white-dQDc2xJxhN8-unsplash_dklj5x.jpg"
  },
  {
    name: "The Clérigos Tower",
    description: "The Clérigos Church is a Baroque church in the city of Porto, in Portugal.",
    address: "R. de São Filipe de Nery, 4050-546 Porto, Portugal",
    opening_hours: "Monday-Sunday 9:00am-7:00pm",
    website_url: "http://www.torredosclerigos.pt/en/",
    city_name: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686855929/andre-fuck-cMqe7QVhV-U-unsplash_bw8pmo.jpg"
  },

  # Attractions in Paris
  {
    name: "Eiffel Tower",
    description: "The Eiffel Tower is a wrought-iron lattice tower located on the Champ de Mars in Paris.",
    address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France",
    opening_hours: "Monday-Sunday 9:30am-11:00pm",
    website_url: "https://www.toureiffel.paris/en",
    city_name: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686771091/development/4uejn8zraiim9shzyhwjcyjei6vc.jpg"
  },
  {
    name: "Louvre Museum",
    description: "The Louvre Museum is the world's largest art museum and a historic monument in Paris.",
    address: "Rue de Rivoli, 75001 Paris, France",
    opening_hours: "Monday, Thursday, Saturday, Sunday 9:00am-6:00pm, Wednesday, Friday 9:00am-9:45pm",
    website_url: "https://www.louvre.fr/en/homepage",
    city_name: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686809877/development/dlai48wf3qw9twuwvnb6a8seetls.jpg"
  },
  {
    name: "Notre-Dame Cathedral",
    description: "Notre-Dame Cathedral is a medieval Catholic cathedral in the heart of Paris.",
    address: "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France",
    opening_hours: "Monday-Sunday 7:45am-6:45pm",
    website_url: "https://www.notredamedeparis.fr/en/",
    city_name: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686855934/chris-desort-uj5mMdSuJgw-unsplash_hplphl.jpg"
  },
  {
    name: "Montmartre",
    description: "Montmartre is a historic neighborhood known for its bohemian atmosphere and the iconic Sacré-Cœur Basilica.",
    address: "Montmartre, 75018 Paris, France",
    opening_hours: "Open 24/7",
    website_url: "https://www.montmartreparis.com/",
    city_name: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686855932/wendell-adriel-xsBAXzjSuzA-unsplash_kxv54b.jpg"
  },

  # Attractions in Berlin
  {
    name: "Brandenburg Gate",
    description: "The Brandenburg Gate is an 18th-century neoclassical monument in Berlin.",
    address: "Pariser Platz, 10117 Berlin, Germany",
    opening_hours: "Open 24/7",
    website_url: "https://www.visitberlin.de/en/brandenburg-gate",
    city_name: "Berlin",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686837566/development/0tjsez649aw4grc3l6q1phyzdfh8.jpg"
  },
  {
    name: "Berlin Wall East Side Gallery",
    description: "The East Side Gallery is an open-air gallery consisting of a section of the Berlin Wall.",
    address: "Mühlenstraße, 10243 Berlin, Germany",
    opening_hours: "Open 24/7",
    website_url: "https://www.eastsidegallery-berlin.de/",
    city_name: "Berlin",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686855930/pascal-bernardon-2CkIpl-LhR4-unsplash_awarpy.jpg"
  },
  {
    name: "Museum Island",
    description: "Museum Island is a UNESCO World Heritage site located on the northern part of an island in the Spree river.",
    address: "Museum Island, 10178 Berlin, Germany",
    opening_hours: "Varies by museum",
    website_url: "https://www.smb.museum/en/museums-and-institutions/museum-island-berlin/home.html",
    city_name: "Berlin",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686855930/juan-martin-lopez-Ph5u0uYT4CE-unsplash_yzkdpv.jpg"
  },
  {
    name: "Checkpoint Charlie",
    description: "Checkpoint Charlie was the best-known border crossing between East and West Berlin during the Cold War.",
    address: "Friedrichstraße 43-45, 10117 Berlin, Germany",
    opening_hours: "Open 24/7",
    website_url: "https://www.visitberlin.de/en/checkpoint-charlie",
    city_name: "Berlin",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686855928/michael-fousert-k7voeObMzkk-unsplash_mxhczu.jpg"
  }
]

attractions_data.each do |attraction_data|
  city = City.find_by(name: attraction_data[:city_name])
  if city
    attraction = Attraction.create!(
      name: attraction_data[:name],
      description: attraction_data[:description],
      address: attraction_data[:address],
      opening_hours: attraction_data[:opening_hours],
      website_url: attraction_data[:website_url],
      city_id: city.id
    )
    file = URI.open(attraction_data[:photo_url])
    attraction.photo.attach(io: file, filename: File.basename(attraction_data[:photo_url]), content_type: "image/png")
    attraction.save!
    puts "#{attraction.name} created"
  end
end

puts "Attractions created!"


puts "Creating events"
users = User.all
events_data = [
  # Events in Porto
  {
    name: "Brazilian Music Festival",
    description: "A three-day music festival featuring Brazilian artists.",
    address: "Parque da Cidade, 4100-128 Porto, Portugal",
    date: "2023-07-15",
    website_url: "https://www.brazilianmusicfestival.com",
    city_name: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857035/karla-vidal-KtA4_lqFhTw-unsplash_dhba5v.jpg",
    user: users.first
  },
  {
    name: "Porto Wine Tasting Tour",
    description: "Explore the famous Port wine cellars and taste a variety of Port wines.",
    address: "Rua do Infante D. Henrique 397, 4050-297 Porto, Portugal",
    date: "2023-08-10",
    website_url: "https://www.portowinetasting.com",
    city_name: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857024/douglas-lopez-Lf5Xzq6NvWw-unsplash_vnbfrc.jpg",
    user: users.first
  },
  {
    name: "French Food Festival",
    description: "A gastronomic event showcasing the best French food vendors in Porto.",
    address: "Praça D. João I, 4000-295 Porto, Portugal",
    date: "2023-09-05",
    website_url: "https://www.frenchfoodfest.com",
    city_name: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857028/jessica-ruscello-AbuQX0g4cdU-unsplash_txgtaz.jpg",
    user: users.first
  },
  {
    name: "Porto Fashion Week",
    description: "A week-long fashion event featuring local designers and international fashion brands.",
    address: "Rua das Flores, 4050-262 Porto, Portugal",
    date: "2023-10-20",
    website_url: "https://www.portofashionweek.com",
    city_name: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857027/tamara-bellis-IwVRO3TLjLc-unsplash_ml31pv.jpg",
    user: users.first
  },

  # Events in Paris
  {
    name: "Paris Jazz Festival",
    description: "A summer music festival dedicated to jazz music, held in the beautiful Parc Floral.",
    address: "Route de la Pyramide, 75012 Paris, France",
    date: "2023-07-01",
    website_url: "https://www.parisjazzfestival.com",
    city_name: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857142/jens-thekkeveettil-dBWvUqBoOU8-unsplash_nkrwml.jpg",
    user: users.first
  },
  {
    name: "Bastille Day Parade",
    description: "A grand military parade on Bastille Day, celebrating French national pride.",
    address: "Champs-Élysées, 75008 Paris, France",
    date: "2023-07-14",
    website_url: "https://www.bastilledayparade.com",
    city_name: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857026/joe-desousa-OSVh2HgbaZc-unsplash_ymo2qg.jpg",
    user: users.first
  },
  {
    name: "Paris Fashion Week",
    description: "One of the world's most prestigious fashion events, showcasing the latest collections.",
    address: "Rue du Faubourg Saint-Honoré, 75008 Paris, France",
    date: "2023-09-25",
    website_url: "https://www.parisfashionweek.com",
    city_name: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857025/mariya-georgieva-0O6Fv3Ff_XI-unsplash_d2h7ol.jpg",
    user: users.first
  },
  {
    name: "Nuit Blanche",
    description: "An all-night arts festival, transforming the streets of Paris into an open-air museum.",
    address: "Various locations in Paris",
    date: "2023-10-07",
    website_url: "https://www.nuitblanche.paris",
    city_name: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857142/scott-webb-zq9RW5I4CdU-unsplash_l6jbty.jpg",
    user: users.first
  },

  # Events in Berlin
  {
    name: "Berlinale",
    description: "One of the world's leading film festivals, showcasing a diverse range of films.",
    address: "Potsdamer Platz, 10785 Berlin, Germany",
    date: "2023-09-09",
    website_url: "https://www.berlinale.de",
    city_name: "Berlin",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857024/chris-murray-YvPxyGzaFJ4-unsplash_yqbhh2.jpg",
    user: users.first
  },
  {
    name: "Berlin Beer Festival",
    description: "The world's longest beer garden, featuring a wide selection of German and international beers.",
    address: "Karl-Marx-Allee, 10178 Berlin, Germany",
    date: "2023-08-04",
    website_url: "https://www.berlinbeerfestival.com",
    city_name: "Berlin",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857023/julian-hochgesang-DAIg7VxsJkM-unsplash_paitdm.jpg",
    user: users.first
  },
  {
    name: "Berlin Art Week",
    description: "A week-long celebration of contemporary art, with exhibitions, installations, and performances.",
    address: "Various locations in Berlin",
    date: "2023-09-13",
    website_url: "https://www.berlinartweek.com",
    city_name: "Berlin",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857023/rhondak-native-florida-folk-artist-_Yc7OtfFn-0-unsplash_y9trxe.jpg",
    user: users.first
  },
  {
    name: "Berlin Marathon",
    description: "One of the world's major marathons, attracting thousands of participants and spectators.",
    address: "Straße des 17. Juni, 10785 Berlin, Germany",
    date: "2023-09-24",
    website_url: "https://www.bmw-berlin-marathon.com",
    city_name: "Berlin",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857039/snapytrack-medaillenhalter-8fUKOQ0mNg4-unsplash_ufao7b.jpg",
    user: users.first
  }
]

events_data.each do |event_data|
  city = City.find_by(name: event_data[:city_name])
  if city
    event = Event.create!(
      name: event_data[:name],
      description: event_data[:description],
      address: event_data[:address],
      date: event_data[:date],
      website_url: event_data[:website_url],
      city_id: city.id,
      user: event_data[:user]
    )
    file = URI.open(event_data[:photo_url])
    event.photos.attach(io: file, filename: File.basename(event_data[:photo_url]), content_type: "image/png")
    event.save!
    puts "#{event.name} created"
  end
end
