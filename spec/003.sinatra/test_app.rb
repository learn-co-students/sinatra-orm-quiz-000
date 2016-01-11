class TestApp < Sinatra::Base
  post '/profile' do
    "<h1>#{params[:name]}</h1><h2>#{params[:occupation]}</h2>"
  end

  get '/search' do
    # DO NOT MODIFY THIS!
    "#{params[:q]} #{params[:order]}"
  end

  get '/hello/:name' do
  	"Hello #{params[:name]}!"
  end

  get '/' do
  	200
  end

  post '/' do
  	200
  end

  get '/zig' do
  	redirect to '/zag'
  end

  get '/zag' do
  	200
  end
end
