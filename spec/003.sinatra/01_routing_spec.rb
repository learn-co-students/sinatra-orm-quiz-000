require 'spec_helper'
require_relative 'test_app'

###############################################################################
##### Instructions ############################################################
###############################################################################
# Add routes to test_app.rb to pass the following tests
###############################################################################
describe Sinatra do
  describe "routing" do
    def app
      TestApp
    end

    describe "GET" do
     it "handles GET to /" do
        get '/'
        expect(last_response.status).to eq(200)
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
