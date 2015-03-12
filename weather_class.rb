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

  @response = JSON.parse(get_url_response)

  def weather_description
    @response["weather"][0]['description']
  end

  def weather_humidity
    @response["main"]['humidity']
  end

  def weather_temperature
    @response["main"]['temp'].to_i
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

  def user_input
    input = []
    loop do
      puts "Choose a city you want to check.Press '0' if none."
      city = gets.chomp.capitalize
      break if city == "0"
      puts "What is your chosen language to display information about this city?"
      language = gets.chomp.downcase
      weather = Weather.new(city, language)
      input.push(weather)
    end
    input
  end


  def create_table
    title = "Weather around the Globe"
    headers = ['City', 'Weather Description', 'Temperature', 'Humidity']
    n = 55
    puts title.center(n)
    puts
    n.times { print "-" }
    puts
    head = "| " + headers.join(" | ") + " |"
    puts head
    n.times { print "-" }
  end


end

