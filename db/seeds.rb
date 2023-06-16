require "open-uri"

puts "Cleaning Database"
Attraction.delete_all
puts "attractions clear"
Community.delete_all
puts "communites clear"
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
  { first_name: "Alexandre", last_name: "Almeida", email: "alex@lewagon.com", password: "123456", username: "alexthelion" },
  { first_name: "Divya", last_name: "Savai", email: "divya@lewagon.com", password: "123456",username: "alexthelion" },
  { first_name: "Christophe", last_name: "Deissenberg", email: "christophe@lewagon.com", password: "123456", username: "alexthelion" },
  { first_name: "Karina", last_name: "Basurto", email: "kar@lewagon.com", password: "123456", username: "alexthelion" }
]

users_data.map do |user_data|
  User.create!(user_data)
end
puts 'Finished!'

puts "Creating city"
cities_data = [
  { name: "Porto", description: "Porto is a fascinaating and vibrant city, entices with its historic center and sumptuous food and wine.", country: "Portugal" },
  { name: "Paris", description: "Porto is a fascinaating and vibrant city, entices with its historic center and sumptuous food and wine.", country: "France" },
  { name: "Berlin", description: "Porto is a fascinaating and vibrant city, entices with its historic center and sumptuous food and wine.", country: "Germany" }

]
city_photos = ["https://images.unsplash.com/photo-1555881400-74d7acaacd8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80","https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2020&q=80","https://images.unsplash.com/photo-1560969184-10fe8719e047?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80" ]
index = 0
cities_data.map do |city_data|
  city = City.create!(city_data)
  city.photo.attach(io: URI.open(city_photos[index]), filename: "nes.png", content_type: "image/png")
  city.save
  index += 1
end
puts 'Finished!'


puts "Creating attractions"
attractions_data = [
  { name: "Livraria Lello", description: "Porto’s most famous bookstore was built all the way back in 1906! The Lello brothers, who were running a bookstore at the time, hired the engineer Xavier Esteves to construct the Livraria Lello on Rua das Carmelitas.", address: " R. das Carmelitas 144, 4050-161 Porto, Portugal", opening_hours: "Monday-Sunday 9:00am -7:30pm", website_url: "https://www.livrarialello.pt/en/home",
  latitude:41.1469, longitude: 8.6148},

  { name: "Porto São Bento", description: "Porto São Bento Station is without a doubt the most beautiful train station in Portugal, and certainly one of the most beautiful in the world,we recommend that you see its beautiful atrium", address: "Praça de Almeida Garrett, 4000-069 Porto, Portugal", opening_hours: "Monday-Friday 8:00am-6:00pm, Saturday 9:00am-4:30pm, Sunday closed", website_url: "https://www.portugaltrains.com/porto-sao-bento-train-station.html", latitude: 41.1455, longitude: 8.6095},

  { name: "Casa da Musica", description: "One of Porto’s leading cultural venues, designed by the architect, Rem Koolhaas.Home of the national Orchestra of Porto", address: " Av. da Boavista 604-610, 4149-071 Porto, Portugal", opening_hours: "Monday-Saturday 10:00am-7:00pm, Sunday 10:00am-6:00pm", website_url: "https://www.portugaltrains.com/porto-sao-bento-train-station.html",latitude: 41.1589,longitude: 8.6307},

  { name: "The Clérigos tower", description: "The Clérigos Church is a Baroque church in the city of Porto, in Portugal. Its 75-meter-tall bell tower, the Torre dos Clérigos, can be seen from various points of the city and is one of its most characteristic symbols", address: " R. de São Filipe de Nery, 4050-546 Porto, Portugal", opening_hours: "Monday-Sunday 9:00am-7:00pm", website_url: "http://www.torredosclerigos.pt/en/", latitude: 41.1459, longitude: 8.6139}
 ]

attractions_data.map do |attraction_data|
  attraction = Attraction.new(attraction_data)
  attraction.city = City.first
  attraction.save!
end
puts 'Finished!'


puts "Creating community"

communities_data = [
  { name: "Brasilian", description: "This is our Brazilian community here on Culture Comb, Join this community and find events!"},
  { name: "French", description: "This is our French community here on Culture Comb, Join this community and find events!"},
]
communities_data.map do |community_data|
community = Community.new(community_data)
community.user = User.first
community.city = City.first
community.save!
end
puts 'Finished!'


puts "Creating category"

categories_data = [
  { name: "Music"},
  { name: "Art"},
  { name: "Food"}
]
categories_data.map do |category_data|
  Category.create!(category_data)
end
puts 'Finished!'

puts "Creating chatroom"

Chatroom.create(name: "General")

puts "Finished chatroom!"
puts "Done! Heroku "
