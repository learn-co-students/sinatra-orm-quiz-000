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

    describe "POST" do
      it "handles POST to /" do
         post '/'
         expect(last_response.status).to eq(200)
       end
    end

    describe "redirecting" do
      it "should follow a redirect from /zig to /zag" do
        get "/zig"
        follow_redirect!

        "http://example.org/zag".should == last_request.url
        expect(last_response.status).to eq(200)
      end
    end
  end
end
