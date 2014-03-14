require_relative './003_sinatra_spec_helper'

# Sinatra Routing
#
# Instructions:
#
# Add routes to test_app.rb to pass the following tests
# You will not need to edit the tests

describe Sinatra do
  describe "routing" do
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
      it "follows a redirect from /zig to /zag" do
        get "/zig"
        follow_redirect!

        expect(last_request.url).to eq("http://example.org/zag")
        expect(last_response.status).to eq(200)
      end
    end
  end
end
