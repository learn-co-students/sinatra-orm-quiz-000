require_relative 'crowd_fundr_campaign'

describe "ORMs" do
  context "a CrowdFundrCampaign model" do
    before do
      @path = File.dirname(__FILE__)
      Sequel::Migrator.run DB, "#{@path}/migrations"
    end

    describe "adding ORM capabilities" do
      it "should subclass Sequel::Model" do
        campaign = CrowdFundrCampaign.new
        campaign.class.superclass.should == Sequel::Model end
    end

    describe "creating" do
      it "should create a record for CrowdFundrCampaigns" do
        # TODO: Your solution goes here

        CrowdFundrCampaign.all.count.should == 1
      end
    end

    describe "reading" do
      it "should have readable fields" do
        name = "Soylent"
        tagline = "Free your body."
        funding_goal = 10000000
        starting_date = Time.new(2013, 6, 15)
        finishing_date = Time.new(2013, 8, 30)

        campaign = CrowdFundrCampaign.create({
          name: name,
          tagline: tagline,
          funding_goal: funding_goal,
          starting_date: starting_date,
          finishing_date: finishing_date
        })

        row_values = []

        # TODO: Your solution goes here

        row_values.should include(campaign.id)
        row_values.should include(name)
        row_values.should include(tagline)
        row_values.should include(funding_goal)
        row_values.should include(starting_date)
        row_values.should include(finishing_date)
      end
    end

    describe "update" do
      it "should change the name of the campaign" do
        campaign_name = "Sham-Wow"
        campaign = CrowdFundrCampaign.create( name: campaign_name )

        # TODO: Your solution goes here

        CrowdFundrCampaign.first.name.should_not == campaign_name
      end
    end

    describe "destroy" do
      it "should remove a record from the DB" do
        campaign = CrowdFundrCampaign.create( name: campaign_name )

        # TODO: Your solution goes here

        CrowdFundrCampaign.all.count.should == 0
      end
    end
  end
end
