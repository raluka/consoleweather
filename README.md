## ConsoleWeather

Tells the weather of a given location.

It does:

 1. Ask the user to input a location.
 2. Fetch the weather report from the internet and show the current weather to the user.

Requirements

 *  Ruby
 *  Internet connection

Usage

    ruby weather.rb

You might need an API key from: http://openweathermap.org/appid

**Please fork and improve me ;)**

ConsoleWeather Application. Please commit useful increments to build up your history.

1. Improve the ConsoleWeather application by
    Encapsulating logic into functions
    Using a Constant to store the permanent part of the API URL.
    Not using additional global variables.
2. Allow the user to enter 2 locations
    The Application asks for two locations.
    The result should include the current weather description, the temperature in Celsius and the humidity in %.
    The weather data should be printed in a table like structure.
3. Next think about what must be changed if we allow the user to just enter 1 location and not a second location. Then implement it.
4. What must be changed if the user could enter an arbitrary number ob locations? Also consider the API documentation. No implementation needed.
5. Keep the 'Readme.md' up to date.
6. Push your changes to your repository. And if you like ask for feedback!

Optional tasks:
Allow the user to specify in which localisation (= Language and Culture) he/she want's the weather information should be displayed.
Present the weather as text based pictograms. Draw a snowman if they had more than 5 centimetres of snow.
My idea how it might look like:

| Location | Weather             | Temperature | Humidity | Pic   |
+----------+---------------------+-------------+----------+-------+
| Berlin   | ein paar Wolken     |     2.00 ˚C |     72 % |  ~  ~ |
| Moscow   | überwiegend bewölkt |   -10.13 ˚C |     70 % | ~~ ~~ |

-------------------------------------------------------------------------------------------------------------

##Features

**User**

1. As a user, I want to find weather for a specific location.
2. As a user, I want to read response in a specific language.

**Developer**

1. As a developer, I want to read keyboard input.
2. As a developer, I want to access weather API and store response.
3. As a developer, I want to print weather for a specific city in a table as text, temperature C, % humidity and emoticon.
4. As a developer, I want to offer answer in many languages.

