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
  end
end
