# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"
require "open-uri"

puts "seed destruction"

Post.destroy_all


puts "seed creation"

url = "https://hacker-news.firebaseio.com/v0/topstories.json"
user_serialized = URI.parse(url).read
user = JSON.parse(user_serialized)

# puts "#{user}"

user.first(30).each do |api|
call_api = "https://hacker-news.firebaseio.com/v0/item/#{api}.json"
call_api_serialized = URI.parse(call_api).read
info_api = JSON.parse(call_api_serialized)
Post.create!(title:"#{info_api["title"]}",post_type:"#{info_api["type"]}", url:"#{info_api["url"]}", score:"#{info_api["score"]}", author:"#{info_api["by"]}")

 puts "Article succesfully created"

end

# puts "#{user["name"]} - #{user["bio"]}"


# post = Post.new(title: "exemple d'un article", post_type: "test", url:"wwww.google.com", score:90, author:"Thomas Alonso")
# post.save



puts "seed terminated"
