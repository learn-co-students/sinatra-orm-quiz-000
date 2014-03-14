require_relative './002_orm_spec_helper'

describe "ORMs" do

  # Utilizing ORM Querying Functions
  #
  # Instructions:
  #
  # Edit the CrowdFundrCampaign class to make the following tests pass.
  # You will not need to edit the tests.

  context "querying" do
    before(:all) do
      @path = File.dirname(__FILE__)
      @db = ActiveRecord::Base.connection
      ActiveRecord::Migrator.migrate('db/migrate')

      now = Time.now

      @c1 = CrowdFundrCampaign.create(
        name: "The Cactus Book",
        tagline: "Insert pun about book spines",
        total_funding: 300,
        funding_goal: 1000,
        starting_date: Time.new(now.year, 9, 24),
        finishing_date: Time.new(now.year, 12, 31)
      )

      @c2 = CrowdFundrCampaign.create(
        name: "Double Fine Adventure",
        tagline: "From the makers of Monkey Island!",
        total_funding: 50000,
        funding_goal: 1000000,
        starting_date: Time.new(now.year, 5, 24),
        finishing_date: Time.new(now.year, 12, 24)
      )

      @c3 = CrowdFundrCampaign.create(
        name: "Oculus Rift",
        tagline: "Step Into the Game",
        total_funding: 620000,
        funding_goal: 500,
        starting_date: Time.new(now.year, 1, 24),
        finishing_date: Time.new(now.year+1, 8, 24)
      )

      @c4 = CrowdFundrCampaign.create(
        name: "My Yoga Pro Book",
        tagline: "A revolutionary way to learn and practice yoga",
        total_funding: 600,
        funding_goal: 500,
        starting_date: Time.new(now.year, 3, 24),
        finishing_date: Time.new(now.year+1, 12, 01)
      )
    end

    describe "CrowdFundrCampaign" do
      describe "::funded_campaigns" do
        it "returns a set of funded campaigns" do
          funded_campaigns = CrowdFundrCampaign.funded_campaigns

          expect(funded_campaigns.count).to eq(2)
          expect(funded_campaigns).to include(@c3)
          expect(funded_campaigns).to include(@c4)
        end
      end

      describe "::book_campaigns" do
        it "returns all campaigns that have the term 'book' in the title" do
          book_campaigns = CrowdFundrCampaign.book_campaigns

          expect(book_campaigns.count).to eq(2)
          expect(book_campaigns).to include(@c1)
          expect(book_campaigns).to include(@c4)
        end
      end

      describe "::latest_finish" do
        it "returns the campaign that will be the last to end" do
          campaign = CrowdFundrCampaign.latest_finish
          expect(campaign).to eq(@c4)
        end
      end
    end
  end
end
