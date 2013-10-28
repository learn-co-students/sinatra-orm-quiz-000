require_relative 'crowd_fundr_campaign'

describe "ORMs" do
  context "a CrowdFundrCampaign model" do
    before do
      @path = File.dirname(__FILE__)
      Sequel::Migrator.run DB, "#{@path}/migrations"
    end

    describe "adding ORM capabilities" do
      it "should subclass Sequel::Model" do
        cfc = CrowdFundrCampaign.new
        cfc.class.superclass.should == Sequel::Model
      end
    end

    describe "create" do
      it "should create a record for CrowdFundrCampaigns" do
        # TODO: Your solution goes here

        CrowdFundrCampaign.all.count.should == 1
      end
    end

    describe "update" do
    end

    describe "read" do
    end

    describe "destroy" do
    end
  end
end
