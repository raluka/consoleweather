require 'open-uri'
require 'json'

class Weather

  WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?q="

  attr_reader :city
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
  def initialize
    @input = Array.new
  end



  def user_input
=begin
    loop do
      puts "Choose a city you want to check.Press '0' if none."
      city = gets.chomp.capitalize
      break if city == "0"
      puts "What is your chosen language to display information about this city?"
      language = gets.chomp.downcase
      weather = Weather.new(city, language)
      @input.push(weather)
    end
=end
    @input = [Weather.new("Berlin", "en"), Weather.new("London", "en")]
  end

  def create_rows(arry)
    arry.map do |item|
      information = [item.city, item.weather_description, item.weather_temperature, item.weather_humidity]
      row = "| " + information.join("      | ") + "      |"
      puts row
    end
  end

  def create_table
    title = "Weather around the Globe"
    headers = ['City', 'Weather Description', 'Temperature', 'Humidity']
    n = 85
    puts title.center(n)
    puts
    n.times { print "-" }
    puts
    head = "| " + headers.join("      | ") + "      |"
    puts head
    n.times { print "-" }
    puts
    create_rows(@input)
    n.times { print "-" }
  end

end

puts "Where do you want to travel today? You can choose multiple cities to compare weather. Press '0' to view result.
Choose a language to display required information. For example, choose 'en' for English."
puts
puts "English - en, Russian - ru, Italian - it, Spanish - es, Ukrainian - uk, German - de,
Portuguese - pt, Romanian - ro, Polish - pl, Finnish - fi, Dutch - nl, French - fr,
Bulgarian - bg, Swedish - sv, Chinese Traditional - zh_tw, Chinese Simplified - zh,
Turkish - tr, Croatian - hr, Catalan - ca"
puts
user = UserIO.new
user.user_input
user.create_table
