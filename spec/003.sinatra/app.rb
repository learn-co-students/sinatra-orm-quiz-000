class ParamsApp < Sinatra::Base
  post '/profile' do
    erb :profile
  end

  get '/search' do
    params[:q].upcase
  end
end
