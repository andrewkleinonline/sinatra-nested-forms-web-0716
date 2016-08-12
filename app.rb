require './environment'
require_relative './app/models/pirate.rb'
require_relative './app/models/ship.rb'


module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here


    get '/' do
      erb :root
    end

    # configure do
    #   set :views, "views/pirates"
    # end

    get '/new' do
      erb :'/pirates/new'
    end

    post '/pirates' do
      pirate_data = params["pirate"]
      ship1_data = params["pirate"]["ships"][0]
      ship2_data = params["pirate"]["ships"][1]
      @pirate = Pirate.new(pirate_data["name"],pirate_data["weight"],pirate_data["height"])
      @ship1 = Ship.new(ship1_data["name"],ship1_data["type"],ship1_data["booty"])
      @ship2 = Ship.new(ship2_data["name"],ship2_data["type"],ship2_data["booty"])
      @data = params
      erb :'/pirates/show'
    end

  end
end
