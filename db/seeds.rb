# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'
require 'open-uri'

puts "Cleaning database..."
Movie.destroy_all

top_movies_url = "https://tmdb.lewagon.com/movie/top_rated"
top_movie = JSON.parse(URI.open(top_movies_url).read)

10.times do |i|
  movie = Movie.create!(
    title: top_movie["results"][i]["title"],
    overview: top_movie["results"][i]["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{top_movie["results"][i]["poster_path"]}",
    rating: top_movie["results"][i]["vote_average"]
  )
  puts "Created #{movie.title}"
end


#write a loop to count the movie created and display the number of movies created
puts "#{Movie.count} movies created"

puts "Finished!"
