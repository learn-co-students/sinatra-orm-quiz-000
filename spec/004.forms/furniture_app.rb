class FurnitureApp < Sinatra::Base
  get '/chair' do
    erb :chair_form
  end

  post '/chair' do
    name = params[:name]
    description = params[:description]

    "#{name.upcase} #{description.upcase}"
  end
end
