class WeatherLookup 


def fetch_weather
  HTTParty.get("http://api.wunderground.com/api/51867148889d7a15/hourly/q/60605.xml")
end

attr_accessor :temperature, :icon, :condition

def initialize
  weather_hash = fetch_weather
  assign_values(weather_hash)
end

def assign_values(weather_hash)
  hourly_forecast_response = weather_hash.parsed_response['response']['hourly_forecast']['forecast'].first
  self.temperature = hourly_forecast_response['temp']['english']
  self.icon = hourly_forecast_response['icon_url']
  self.condition = hourly_forecast_response['condition']
end

end