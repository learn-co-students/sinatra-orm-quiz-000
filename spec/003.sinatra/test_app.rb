class TestApp < Sinatra::Base

	get "/" do
	end

	post "/" do
	end

	get '/zig' do
		redirect to '/zag'
	end

	get '/zag' do
	end

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
end
