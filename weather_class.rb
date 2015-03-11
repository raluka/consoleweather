require 'open-uri'
require 'json'
require 'terminal-table'

class Weather

  WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?q="

  def initialize(city, language)
    @city = city
    @language = language
  end

  def get_url_response
    file = open(WEATHER_URL + @city + "&lang=" + @language + "&units=metric")
    file.read
  end

  def parse_response
    JSON.parse(get_url_response)
  end

  def weather_description
    parse_response["weather"][0]['description']
  end

  def weather_humidity
    parse_response["main"]['humidity']
  end

  def weather_temperature
    parse_response["main"]['temp'].to_i
  end

end

############################
class UserIO


  puts "Where do you want to travel today? You can choose multiple cities to compare weather. Press '0' to view result.
Choose a language to display required information. For example, choose 'en' for English."
  puts
  puts "English - en, Russian - ru, Italian - it, Spanish - es, Ukrainian - uk, German - de,
Portuguese - pt, Romanian - ro, Polish - pl, Finnish - fi, Dutch - nl, French - fr,
Bulgarian - bg, Swedish - sv, Chinese Traditional - zh_tw, Chinese Simplified - zh,
Turkish - tr, Croatian - hr, Catalan - ca"
  puts

  def user_response
    response = {}
    loop do
      puts "Choose a city you want to check.Press '0' if none."
      city = gets.chomp.capitalize
      break if city == "0"
      puts "What is your chosen language to display information about this city?"
      language = gets.chomp.downcase
      response.store(city, language)
    end
    response
  end

  user_choice = user_response

table = Terminal::Table.new do |t|
  t.title = "Weather around the Globe"
  t.headings = 'City', 'Weather Description', 'Temperature', 'Humidity'
  t << [city_1, weather_1.weather_description, weather_1.weather_temperature, weather_1.weather_humidity]
  t << :separator
  t << [city_2, weather_2.weather_description, weather_2.weather_temperature, weather_2.weather_humidity]
end

puts table

end

