require 'open-uri'
require 'json'

WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?q="

def get_user_location
  puts 'Where would you like to travel today?'
  @location = gets.chomp.capitalize
  if  @location.empty?
    puts "You need to enter a location with more than 2 letters."
    get_user_location
  end
end

def get_weather
  file = open(WEATHER_URL + @location)
  @contents = file.read
end

def parse_response
  JSON.parse(@contents)
end

def tell_weather
  puts "The weather in #{ @location } is : #{@weather_description}"
end

def run
  get_user_location
  get_weather
  if parse_response["cod"] == 200
    weather = parse_response["weather"]
    @weather_description = weather[0].fetch('description')
    tell_weather
  else
    puts parse_response["message"]
  end
end

run