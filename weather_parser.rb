require_relative 'user'
require 'open-uri'
require 'json'

class WeatherParser

  WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?q="

  def initialize user
    @data = user.data
    parsed_response
  end

  def parsed_response
    @data.each do |element|
      weather_details = []
      url_response = open(WEATHER_URL + element[:city] + "&lang=" + element[:lang] + "&units=metric").read
      url_json = JSON.parse(url_response)
      weather_details << [url_json, element[:city]]
    end
  end
end