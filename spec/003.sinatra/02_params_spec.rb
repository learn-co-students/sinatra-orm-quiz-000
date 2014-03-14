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
        it "GET /search should accept the keys 'q' and 'order'" do

          # TODO: Create a query string here!
          # Set the key "q" to "pizza"
          # and the key "order" to "desc"
          query_string = __

          get "/search#{query_string}"

          last_response.body.should == "pizza desc"
        end
      end

      describe "POST bodies" do
        it "should process the template using the posted data" do
          post '/profile', {
            name: 'Gaius Baltar',
            occupation: 'Scientist'
          }

          # TODO: make this route action return this html
          last_response.body.should == "<h1>Gaius Baltar</h1><h2>Scientist</h2>"

          post '/profile', {
            name: 'Kara Thrace',
            occupation: 'Pilot'
          }

          last_response.body.should == "<h1>Kara Thrace</h1><h2>Pilot</h2>"
        end
      end

      describe "named parameters" do
        it 'should return the string "Hello #{name}!"' do
          get '/hello/Winston%20Churchill'

          last_response.body.should == 'Hello Winston Churchill!'
        end
      end
    end
  end
end
