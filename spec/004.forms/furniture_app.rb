class FurnitureApp < Sinatra::Base
  get '/chairs/new' do
    erb :chair_form
  end

  post '/chairs' do
    name = params[:name]
    description = params[:description]

    "#{name.upcase} #{description.upcase}"
  end

  get '/lamps/new' do
    erb :lamp_form
  end

  post '/lamps' do
    params[:lamp][:colors].values.join(',')
  end

  get '/tables/new' do
    erb :table_form
  end

  post '/tables' do
    table = params[:table]

    "#{table[:name].upcase} #{table[:wood].upcase} #{table[:price]}"
  end
end
