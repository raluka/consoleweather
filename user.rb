class User
  attr_reader :city, :data

  def initialize
    @data = []
  end

  def keyboard_input
    languages_list = ["en", "ru", "it", "es", "uk", "de", "pt", "ro", "pl", "fi", "nl", "fr", "bg", "sv", "zh_tw", "zh", "tr", "hr", "ca"]
    loop do
      puts "Choose a city you want to check.Press '0' if none."
      city = gets.chomp.capitalize
      break if city == "0"
      puts "What is your chosen language to display information about this city?"
      language = gets.chomp.downcase
      unless languages_list.include?(language)
        puts "This language is not a valid one. Please choose a valid language."
        language = gets.chomp.downcase
      end
      @data << {city: city, lang: language}
    end
  end

end

puts "Where do you want to travel today? You can choose multiple cities to compare weather. Press '0' to view result.
Choose a language to display required information. For example, choose 'en' for English."
puts
puts "English - en, Russian - ru, Italian - it, Spanish - es, Ukrainian - uk, German - de,
Portuguese - pt, Romanian - ro, Polish - pl, Finnish - fi, Dutch - nl, French - fr,
Bulgarian - bg, Swedish - sv, Chinese Traditional - zh_tw, Chinese Simplified - zh,
Turkish - tr, Croatian - hr, Catalan - ca"