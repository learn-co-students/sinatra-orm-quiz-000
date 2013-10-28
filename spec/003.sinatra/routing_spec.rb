require 'spec_helper'
require_relative 'app'

describe "routing" do
  def app
    App
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
end
