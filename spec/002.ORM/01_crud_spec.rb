require_relative './002_orm_spec_helper'

describe "ORMs" do

  # Utilizing ORM functions
  #
  # Instructions:
  #
  # Insert your code in each test where it says "TODO".
  # Do NOT modify any existing test code.
  #
  # You'll be building your ORM into the crowd_fundr_campaign.rb unit.
  # So you'll have to edit that file to make these tests pass.

  context "a CrowdFundrCampaign model" do
    before do
      @path = File.dirname(__FILE__)
      @db = ActiveRecord::Base.connection
      ActiveRecord::Migrator.migrate('db/migrate')
    end

    describe "adding ORM capabilities" do
      it "should subclass ActiveRecord::Base" do
        campaign = CrowdFundrCampaign.new
        expect(campaign.class.superclass).to eq(ActiveRecord::Base)
      end
    end

    describe "create" do
      it "should create a record for CrowdFundrCampaigns" do
        # TODO: Your solution goes here
        CrowdFundrCampaign.create
        expect(CrowdFundrCampaign.all.count).to eq(1)
      end
    end

    describe "read" do
      it "has readable fields" do
        campaign = CrowdFundrCampaign.create(
          name: "Soylent",
          tagline: "Free your body.",
          total_funding: 10000000,
          funding_goal: 500000,
          starting_date: Time.new(2013, 6, 15),
          finishing_date: Time.new(2013, 8, 30)
        )

        # TODO: Get these to pass
        expect(campaign.name).to eq("Soylent")
        expect(campaign.tagline).to eq("Free your body.")
        expect(campaign.total_funding).to eq(10000000)
        expect(campaign.funding_goal).to eq(500000)
        expect(campaign.starting_date).to eq(Time.new(2013, 6, 15))
        expect(campaign.finishing_date).to eq(Time.new(2013, 8, 30))
      end
    end

    describe "update" do
      before do
        CrowdFundrCampaign.destroy_all
      end
      
      it "changes the name of the campaign" do
        campaign_name = "Sham-Wow"
        campaign = CrowdFundrCampaign.create(name: campaign_name)

        # Edit the campaign object and save it
        # TODO: Your solution goes here
        campaign.update(name: "Wow-Sham")
        expect(CrowdFundrCampaign.first.name).to_not eq(campaign_name)
      end
    end

    describe "destroy" do
      it "removes a record from the DB" do
        campaign = CrowdFundrCampaign.create(name: 'Slap Chop')

        # Delete the campaign record from the database
        # TODO: Your solution goes here
        campaign.destroy
        expect(CrowdFundrCampaign.all.count).to eq(0)
      end
    end
  end
end
