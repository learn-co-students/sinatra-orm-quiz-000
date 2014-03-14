require_relative './003_sinatra_spec_helper'

# Using request data in an action
#
# Instructions:
#
# Follow the descriptions and assertions in each test.

describe Sinatra do
  describe "params" do
    context "TestApp" do
      describe "query strings" do
        # Query strings look like ?key=value
        # vs named params, which look like /user/:id
        it "GET /search accepts the keys 'q' and 'order'" do

          # TODO: Create a query string here!
          # Set the key "q" to "pizza"
          # and the key "order" to "desc"
          query_string = __

          get "/search#{query_string}"

          expect(last_response.body).to eq("pizza desc")
        end
      end

      describe "POST bodies" do
        it "processes the template using the posted data" do
          post '/profile', {
            name: 'Gaius Baltar',
            occupation: 'Scientist'
          }

          # TODO: make this route action return this html
          expect(last_response.body).to eq("<h1>Gaius Baltar</h1><h2>Scientist</h2>")

          post '/profile', {
            name: 'Kara Thrace',
            occupation: 'Pilot'
          }

          expect(last_response.body).to eq("<h1>Kara Thrace</h1><h2>Pilot</h2>")
        end
      end

      describe "named parameters" do
        it 'returns the string "Hello #{name}!"' do
          get '/hello/Winston%20Churchill'

          expect(last_response.body).to eq('Hello Winston Churchill!')
        end
      end
    end
  end
end
