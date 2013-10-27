require_relative 'crowd_fundr_campaign'

describe "ORMs" do
  context "a CrowdFundrCampaign model" do
    describe "adding ORM capabilities" do
      it "should subclass Sequel::Model" do
        cfc = CrowdFundrCampaign.new
        cfc.class.superclass.should == Sequel::Model
      end
    end

    describe "create" do
    end

    describe "update" do
    end

    describe "read" do
    end

    describe "destroy" do
    end
  end
end
