require 'spec_helper'
require_relative 'test_app'

###############################################################################
##### Instructions ############################################################
###############################################################################
# Add routes to test_app.rb to pass the following tests
###############################################################################
describe Sinatra do
  describe "params" do
    context "TestApp" do
      def app
        TestApp
      end

      describe "query strings" do
        it "should send the value of variable search with the key 'q' to the GET /search path" do
          search = "best%20rice%20steamer"

          # TODO: Add a query string to this path
          # Send the value of the 'search' variable with the key 'q'
          path = "/search"

          get path

          last_response.body.should == URI.decode(search.upcase)
        end
      end

      describe "POST bodies" do
        it "should process the template using the posted data" do
          post '/profile', {
            name: 'Gaius Baltar',
            occupation: 'Scientist'
          }

          last_response.body.should == <<-eos
            <div>
              <h1>Gaius Baltar</h1>
              <h2>Scientist</h2>
            </div>
          eos
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
