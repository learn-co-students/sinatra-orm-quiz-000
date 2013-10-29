class TestApp < Sinatra::Base
  post '/profile' do
    erb :profile
  end

  get '/search' do
    raise "Incorrect value for q!" unless params[:q] == "pizza"
    raise "Incorrect value for sort!" unless params[:sort] == "desc"

    "search results..."
  end
end
