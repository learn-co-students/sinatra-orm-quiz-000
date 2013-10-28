class App < Sinatra::Base
  get '/' do
    erb :profile
  end

  post '/' do
  end
end
