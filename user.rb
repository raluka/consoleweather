class User
  attr_reader :city, :data

  def initialize
    @data = []
    keyboard_input
  end

  def keyboard_input
    languages_list = %w(en ru it es uk de pt
                        ro pl fi nl fr bg sv zh_tw zh tr hr ca)
    loop do
      puts "Choose a city you want to check.Press '0' if none."
      city = gets.chomp.capitalize
      break if city == '0'
      puts 'What is your chosen language to display information about this city?'
      language = gets.chomp.downcase
      unless languages_list.include?(language)
        puts 'This language is not a valid one. Please choose a valid language.'
        language = gets.chomp.downcase
      end
      @data << { city: city, lang: language }
    end
  end
end
