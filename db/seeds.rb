require "open-uri"

puts "Cleaning Database"
Attraction.delete_all
puts "attractions clean"
FavoriteCategory.delete_all
puts "favorite categories clean"
Category.delete_all
puts "category clean"
Post.delete_all
puts "posts clean!"
Event.delete_all
puts "Events clean"
Community.delete_all
puts "communites clean"
City.delete_all
puts "cities clear"
User.delete_all
puts "users clean"

Chatroom.delete_all
puts "Chatroom clean"

puts "Creating users"

users_data = [
  {
    first_name: "Alexandre",
    last_name: "Almeida",
    email: "alex@culturecomb.com",
    password: "123456",
    username: "alex_1983",
    nationality: "Brazilian",
    current_city: "Porto",
    photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1682538988/anspbresvpivccfpk9ul.jpg",
    admin: false
  },
  {
    first_name: "Divya",
    last_name: "Savai",
    email: "divya@culturecomb.com",
    password: "123456",
    username: "divyadreamer",
    nationality: "Indian",
    current_city: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686904824/Divya_profile_cxh5m5.png",
    admin: false
  },
  {
    first_name: "Christophe",
    last_name: "Deissenberg",
    email: "christophe@culturecomb.com",
    password: "123456",
    username: "cdeissenberg",
    nationality: "French",
    current_city: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686904824/Chris_profile_wnhuli.jpg",
    admin: true
  },
  {
    first_name: "Karina",
    last_name: "Basurto",
    email: "kar@culturecomb.com",
    password: "123456",
    username: "karinab",
    nationality: "Mexican",
    current_city: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686904824/Kar_profile_kwsl9q.jpg",
    admin: false
  },
  {
    first_name: "Admin",
    last_name: "Admin",
    email: "admin@culturecomb.com",
    password: "admin1",
    username: "Admin",
    nationality: "Brazilian",
    current_city: "Porto",
    photo_url: "/Users/alexandre/code/AlexandreMdeAlmeida/culture_comb/culture_comb/app/assets/images/admin.png",
    admin: true
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
  puts city.photo.attached?
  puts "#{city.name} created"
end
puts 'Cities created!'

puts "Creating communities"

communities_data = [
  {
    name: "Brazilian",
    description: "A vibrant community of Brazilians in #{City.name}, celebrating culture, forging connections, and embracing the best of Brazil and Portugal."
  },
  {
    name: "French",
    description: "A vibrant community of Frenchs in #{City.name}, celebrating culture, forging connections, and embracing the best of France and Portugal."
  }
]

# City.all.each do |city|
#   international_communities = communities_data.sample(2)

#   international_communities.each do |community_data|
#     community = Community.new(community_data)
#     community.user = User.first
#     community.city = city
#     community.save!
#   end
# end

City.all.each do |city|
  international_communities = communities_data.dup
  brazilian_community = international_communities.find { |c| c[:name] == "Brazilian" }
  international_communities.delete(brazilian_community)
  international_communities.unshift(brazilian_community)

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
  { name: "Music" },
  { name: "Art" },
  { name: "Food" }
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
    user: users.first,
    phone_number: "+351912345678",
    start_time: "18:00"
  },
  {
    name: "Porto Wine Tasting Tour",
    description: "Explore the famous Port wine cellars and taste a variety of Port wines.",
    address: "Rua do Infante D. Henrique 397, 4050-297 Porto, Portugal",
    date: "2023-08-10",
    website_url: "https://www.portowinetasting.com",
    city_name: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857024/douglas-lopez-Lf5Xzq6NvWw-unsplash_vnbfrc.jpg",
    user: users.first,
    phone_number: "+351912345679",
    start_time: "14:00"
  },
  {
    name: "French Food Festival",
    description: "A gastronomic event showcasing the best French food vendors in Porto.",
    address: "Praça D. João I, 4000-295 Porto, Portugal",
    date: "2023-09-05",
    website_url: "https://www.frenchfoodfest.com",
    city_name: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857028/jessica-ruscello-AbuQX0g4cdU-unsplash_txgtaz.jpg",
    user: users.first,
    phone_number: "+351912345680",
    start_time: "12:00"
  },
  {
    name: "Porto Fashion Week",
    description: "A week-long fashion event featuring local designers and international fashion brands.",
    address: "Rua das Flores, 4050-262 Porto, Portugal",
    date: "2023-10-20",
    website_url: "https://www.portofashionweek.com",
    city_name: "Porto",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857027/tamara-bellis-IwVRO3TLjLc-unsplash_ml31pv.jpg",
    user: users.first,
    phone_number: "+351912345681",
    start_time: "10:00"
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
    user: users.first,
    phone_number: "+33612345678",
    start_time: "18:00"
  },
  {
    name: "Bastille Day Parade",
    description: "A grand military parade on Bastille Day, celebrating French national pride.",
    address: "Champs-Élysées, 75008 Paris, France",
    date: "2023-07-14",
    website_url: "https://www.bastilledayparade.com",
    city_name: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857026/joe-desousa-OSVh2HgbaZc-unsplash_ymo2qg.jpg",
    user: users.first,
    phone_number: "+33612345679",
    start_time: "14:00"
  },
  {
    name: "Paris Fashion Week",
    description: "One of the world's most prestigious fashion events, showcasing the latest collections.",
    address: "Rue du Faubourg Saint-Honoré, 75008 Paris, France",
    date: "2023-09-25",
    website_url: "https://www.parisfashionweek.com",
    city_name: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857025/mariya-georgieva-0O6Fv3Ff_XI-unsplash_d2h7ol.jpg",
    user: users.first,
    phone_number:"+33612345680",
    start_time: "18:00"
  },
  {
    name: "Nuit Blanche",
    description: "An all-night arts festival, transforming the streets of Paris into an open-air museum.",
    address: "Various locations in Paris",
    date: "2023-10-07",
    website_url: "https://www.nuitblanche.paris",
    city_name: "Paris",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857142/scott-webb-zq9RW5I4CdU-unsplash_l6jbty.jpg",
    user: users.first,
    phone_number: "+33612345681",
    start_time: "19:00"
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
    user: users.first,
    phone_number: "+49123456789",
    start_time: "16:00"
  },
  {
    name: "Berlin Beer Festival",
    description: "The world's longest beer garden, featuring a wide selection of German and international beers.",
    address: "Karl-Marx-Allee, 10178 Berlin, Germany",
    date: "2023-08-04",
    website_url: "https://www.berlinbeerfestival.com",
    city_name: "Berlin",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857023/julian-hochgesang-DAIg7VxsJkM-unsplash_paitdm.jpg",
    user: users.first,
    phone_number: "+49123456780",
    start_time: "10:00"
  },
  {
    name: "Berlin Art Week",
    description: "A week-long celebration of contemporary art, with exhibitions, installations, and performances.",
    address: "Various locations in Berlin",
    date: "2023-09-13",
    website_url: "https://www.berlinartweek.com",
    city_name: "Berlin",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857023/rhondak-native-florida-folk-artist-_Yc7OtfFn-0-unsplash_y9trxe.jpg",
    user: users.first,
    phone_number: "+49123456781",
    start_time: "15:00"
  },
  {
    name: "Berlin Marathon",
    description: "One of the world's major marathons, attracting thousands of participants and spectators.",
    address: "Straße des 17. Juni, 10785 Berlin, Germany",
    date: "2023-09-24",
    website_url: "https://www.bmw-berlin-marathon.com",
    city_name: "Berlin",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1686857039/snapytrack-medaillenhalter-8fUKOQ0mNg4-unsplash_ufao7b.jpg",
    user: users.first,
    phone_number: "+49123456782",
    start_time: "09:30"
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

puts "Creating posts..."

# Find existing user, city, and community
users = User.all
cities = City.all
communities = Community.all

posts_data = [
  # Post 1
  {
    title: "Had an Amazing Time at the Brazilian Pool Party!",
    content: "Hey everyone, I had the most incredible time at the Brazilian Pool Party in Porto last year! This party is a must!",
    website_url: "www.braziliancommunity.com/poolparty",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1687426662/friends-speaking-smiling-drinking-cocktails-resting-relaxing-near-swimming-pool_bfee3z.jpg",
    user: users.first,
    city: cities.first,
    community: communities.first
  },

  # Post 2
  {
    title: "Counting Down the Days to the Brazilian Gastronomy Festival!",
    content: "Hey foodies, I'm eagerly counting down the days to the Brazilian Gastronomy Festival in Porto! This event is a paradise for anyone who loves Brazilian cuisine. It's an event you won't want to miss!",
    website_url: "www.braziliancommunity.com/poolparty",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1687425180/top-view-composition-with-delicious-brazilian-food_qtnirj.jpg",
    user: users.first,
    city: cities.first,
    community: communities.first
  },

  # Post 3
  {
    title: "Get Ready to Samba the Night Away at the Brazilian Samba Night!",
    content: "Calling all dance enthusiasts and lovers of Brazilian culture! Get your dancing shoes ready because the Brazilian Samba Night in Porto is going to be extraordinary. Let's create unforgettable memories together!",
    website_url: "www.braziliancommunity.com/poolparty",
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1687425880/carnival-mask-with-confetti-isolated-white-background-masquerade-one-mask-template-carnival_cyf7ef.jpg",
    user: users.first,
    city: cities.first,
    community: communities.first
  }
]

posts_data.each do |post_data|
  post = Post.create!(
    title: post_data[:title],
    content: post_data[:content],
    website_url: post_data[:website_url],
    user_id: post_data[:user].id,
    city_id: post_data[:city].id,
    community_id: post_data[:community].id
  )

  file = URI.open(post_data[:photo_url])
  post.photo.attach(io: file, filename: File.basename(post_data[:photo_url]), content_type: "image/png")

  puts "#{post.title} created!"
end

puts "Creating events..."

# Find existing user, city, and community
users = User.all
cities = City.all
communities = Community.all

community_events_data = [
  # Event 3: Brazilian Pool Party
  {
    name: "Brazilian Pool Party",
    description: "Dive into the Brazilian vibes with our pool party! Enjoy refreshing drinks, tropical beats, and a lively atmosphere by the pool.",
    website_url: "braziliancommunityporto.com/pool-party",
    date: Date.new(2023, 7, 15),
    address: "Porto Beach Club, Rua da Praia, Porto",
    phone_number: "+351 987 654 321",
    start_time: Time.new(2023, 7, 15, 14, 0),
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1687426662/friends-speaking-smiling-drinking-cocktails-resting-relaxing-near-swimming-pool_bfee3z.jpg",
    user: users.first,
    city: cities.first,
    community: communities.first
  },

  # Event 4: Brazilian Gastronomy Festival
  {
    name: "Gastronomy Festival",
    description: "Indulge in the flavors of Brazil at our Gastronomy Festival! Discover a variety of mouthwatering Brazilian dishes, from feijoada to brigadeiros.",
    website_url: "braziliancommunityporto.com/gastronomy-festival",
    date: Date.new(2023, 11, 10),
    address: "Mercado do Bolhão, Rua Formosa, Porto",
    phone_number: "+351 111 222 333",
    start_time: Time.new(2023, 11, 10, 19, 30),
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1687425180/top-view-composition-with-delicious-brazilian-food_qtnirj.jpg",
    user: users.first,
    city: cities.first,
    community: communities.first
  },

  # Event 5: Brazilian Samba Night
  {
    name: "Brazilian Samba Night",
    description: "Join us for a vibrant night filled with Brazilian samba rhythms! Dance the night away, enjoy live performances, and immerse yourself in the energetic Brazilian culture.",
    website_url: "braziliancommunityporto.com/samba-night",
    date: Date.new(2023, 8, 20),
    address: "Samba Club Porto, Rua das Flores, Porto",
    phone_number: "+351 444 555 666",
    start_time: Time.new(2023, 8, 20, 22, 0),
    photo_url: "https://res.cloudinary.com/dwuazcbx4/image/upload/v1687425880/carnival-mask-with-confetti-isolated-white-background-masquerade-one-mask-template-carnival_cyf7ef.jpg",
    user: users.first,
    city: cities.first,
    community: communities.first
  }
]

community_events_data.each do |community_event_data|
  community_event = Event.create!(
    name: community_event_data[:name],
    description: community_event_data[:description],
    website_url: community_event_data[:website_url],
    date: community_event_data[:date],
    address: community_event_data[:address],
    phone_number: community_event_data[:phone_number],
    start_time: community_event_data[:start_time],
    user_id: community_event_data[:user].id,
    city_id: community_event_data[:city].id,
    community_id: community_event_data[:community].id
  )

  file = URI.open(community_event_data[:photo_url])
  community_event.photos.attach(io: file, filename: File.basename(community_event_data[:photo_url]), content_type: "image/png")

  puts "#{community_event.name} created!"
end
