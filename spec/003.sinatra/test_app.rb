class TestApp < Sinatra::Base
  post '/profile' do
    erb :profile
  end

  get '/search' do
    # DO NOT MODIFY THIS!
    "#{params[:q]} #{params[:order]}"
  end
end
