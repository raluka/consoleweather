class Weather
  attr_reader :city, :description, :temp, :humidity

  def initialize(weather_parser)
    @city = weather_parser.last
    @response = weather_parser.first
  end

  def description
    @response.fetch('weather') { [{}] }[0].fetch('description') { 'none' }
  end

  def temp
    temperature = @response.fetch('main') { {} }.fetch('temp') { '0.00' }
    "#{sprintf('%.2f', temperature)} °C"
  end

  def humidity
    number = @response.fetch('main') { {} }.fetch('humidity') { '0' }
    "#{number} %"
  end
end
