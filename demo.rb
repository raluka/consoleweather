require 'open-uri'
require 'json'

class User
  attr_reader :data
  def initialize
    @data = []
  end

  def add_city_and_language(city, language)
    @data << { lang: language, city: city }
  end
end

u = User.new
u.add_city_and_language 'Berlin', 'DE'
u.add_city_and_language 'Bonn', 'EN'
u.add_city_and_language 'Paris', 'EN'
u.add_city_and_language 'FG1235', 'EN'

class WeatherParser
  WEATHER_URL = 'http://api.openweathermap.org/data/2.5/weather?q='

  attr_reader :data, :result

  def initialize(user)
    @data = user.data
    parsed_response
  end

  def parsed_response
    @result = []
    @data.each do |element|
      data = open(WEATHER_URL + element[:city] +
                      '&lang=' + element[:lang] +
                      '&units=metric').read
      @result << [JSON.parse(data), element[:city]]
    end
  end
end

class Weather1
  attr_reader :city, :description, :temp, :humidity

  def initialize(wp)
    @city = wp.last
    @response = wp.first
  end

  def description
    @response.fetch('weather') { [{}] }[0].fetch('description') { 'NONE' }
  end

  def temp
    @response.fetch('main') { {} }.fetch('temp') { 0.00 }
  end

  def humidity
    @response.fetch('main') { {} }.fetch('humidity') { 0.00 }
  end
end
weathers = []
wp ||= WeatherParser.new u

wp.result.each do |element|
  weathers << Weather1.new(element)
end

class TableGenerator
  def initialize(weathers)
    @weathers = weathers
  end

  def create_rows
    @weathers.each do |item|
      information = [item.city, item.description, item.temp, item.humidity]
      row = '| ' + information.join(' | ') + ' |'
      puts row
    end
  end

  def create_table
    title = 'Weather around the Globe'
    headers = ['City', 'Weather Description', 'Temperature', 'Humidity']
    n = 85
    puts title.center(n)
    puts
    n.times { print '-' }
    puts
    head = '| ' + headers.join('      | ') + '      |'
    puts head
    n.times { print '-' }
    puts
    create_rows
    n.times { print '-' }
  end
end

TableGenerator.new(weathers).create_table
