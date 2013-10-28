describe "ORMs" do

  # Utilizing ORM functions
  #
  # Instructions:
  #
  # Insert your code in each test where it says "TODO".
  # Do NOT modify any existing test code.
  #
  # References
  # Sequel lab: https://github.com/flatiron-school/sequel-orms-ruby-003 as reference.
  # Sequel migration docs: http://sequel.rubyforge.org/rdoc/files/doc/schema_modification_rdoc.html#label-Column+types

  context "a CrowdFundrCampaign model" do
    before do
      @path = File.dirname(__FILE__)
      Sequel::Migrator.run DB, "#{@path}/migrations"

      require_relative 'crowd_fundr_campaign'
    end

    describe "adding ORM capabilities" do
      it "should subclass Sequel::Model" do
        campaign = CrowdFundrCampaign.new
        campaign.class.superclass.should == Sequel::Model
      end
    end

    describe "create" do
      it "should create a record for CrowdFundrCampaigns" do
        # TODO: Your solution goes here

        CrowdFundrCampaign.all.count.should == 1
      end
    end

    describe "read" do
      it "should have readable fields" do
        name = "Soylent"
        tagline = "Free your body."
        funding_goal = 10000000
        total_funding = 500000
        starting_date = Time.new(2013, 6, 15)
        finishing_date = Time.new(2013, 8, 30)

        campaign = CrowdFundrCampaign.create({
          name: name,
          tagline: tagline,
          total_funding: total_funding,
          funding_goal: funding_goal,
          starting_date: starting_date,
          finishing_date: finishing_date
        })

        # Hint: make an array of the attributes of your model
        row_values = []

        # TODO: Your solution goes here

        row_values.should include(campaign.id)
        row_values.should include(name)
        row_values.should include(tagline)
        row_values.should include(total_funding)
        row_values.should include(funding_goal)
        row_values.should include(starting_date)
        row_values.should include(finishing_date)
      end
    end

    describe "update" do
      it "should change the name of the campaign" do
        campaign_name = "Sham-Wow"
        campaign = CrowdFundrCampaign.create( name: campaign_name )

        # Edit the campaign object and save it
        # TODO: Your solution goes here

        CrowdFundrCampaign.first.name.should_not eq(campaign_name)
      end
    end

    describe "destroy" do
      it "should remove a record from the DB" do
        campaign = CrowdFundrCampaign.create( name: 'Slap Chop' )

        # Delete the campaign record from the database
        # TODO: Your solution goes here

        CrowdFundrCampaign.all.count.should == 0
      end
    end
  end
end
