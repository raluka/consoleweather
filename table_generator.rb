class TableGenerator
  def initialize(response)
    @results = []
    response.each do |w|
      @results << Weather.new(w)
    end
  end

  def create_rows
    @results.each do |item|
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
