require "sinatra"
require "sinatra/reloader"
require "httparty"
def view(template); erb template.to_sym; end

get "/" do
    units = "imperial" 
  key = "0ebbdc89bea8ab3fd1268837bbfd627c" 
  lat = 42.0574063
  long = -87.6722787
  
    
    url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{long}&units=#{units}&appid=#{key}"
    @forecast = HTTParty.get(url).parsed_response.to_hash
    @temp = "#{@forecast["current"]["temp"]}"
    @weather = "#{@forecast["current"]["weather"][0]["description"]}"
    @wind = "#{@forecast["current"]["wind_gust"]}"
    @dayofweek = 1
    

url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=ed771d3c23e64194b3ce80acfea372e0"
@news = HTTParty.get(url).parsed_response.to_hash
@currentnews = @news["articles"][0, 10]

view "news"
end 