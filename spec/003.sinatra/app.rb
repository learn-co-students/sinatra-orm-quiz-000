class App < Sinatra::Base
  post '/profile' do
    erb :profile
  end
end
