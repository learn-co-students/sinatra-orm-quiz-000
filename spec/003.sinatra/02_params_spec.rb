require 'spec_helper'
require_relative 'test_app'

# Using request data in an action
#
# Instructions:
#
# Follow the descriptions and assertions in each test.
# Edit the test_app.rb to add the routes and actions
# you need. You will not need to edit the tests.

describe Sinatra do
  describe "params" do
    context "TestApp" do

      def app
        TestApp
      end

      describe "query strings" do
        it "GET /search should accept the param 'q' in a querystring" do
          search = "best rice steamer"
          path = "/search"

          get path, :q => search
          last_response.body.should == search

          # TODO: use a querystring not a named parameter!
          get "/search/q"
          last_response.body.should_not be_ok
        end
      end

      describe "POST bodies" do
        it "should process the template using the posted data" do
          post '/profile', {
            name: 'Gaius Baltar',
            occupation: 'Scientist'
          }

          # TODO: make this route action return this html
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
