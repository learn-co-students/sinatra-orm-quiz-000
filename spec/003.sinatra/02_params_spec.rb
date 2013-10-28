require 'spec_helper'
require_relative 'app'

describe Sinatra do
  describe "params" do
    def app
      App
    end

    describe "query strings" do
      it "should send the value of variable search with the key 'q' to the GET /search path" do
        search = "best rice steamer"

        # TODO: Add a query string to this path
        path = "/search"

        get path

        last_response.body.should == search.upcase 
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
