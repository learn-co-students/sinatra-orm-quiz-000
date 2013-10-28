require 'spec_helper'
require_relative 'app'

describe Sinatra do
  describe "params" do
    def app
      App
    end

    describe "query strings" do
      it "should respond with the value of 'q' as the response body" do
        get '/search?q=%73%70%69%63%79%20%63%68%69%63%6B%65%6E'

        last_response.body.should == URI.decode('%73%70%69%63%79%20%63%68%69%63%6B%65%6E')
      end
    end

    describe "POST bodies" do
      it "should render the template with the posted data" do
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
