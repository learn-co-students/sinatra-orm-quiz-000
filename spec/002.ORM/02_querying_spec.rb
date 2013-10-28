describe "ORMs" do
  context "querying" do
    before do
      @path = File.dirname(__FILE__)
      Sequel::Migrator.run DB, "#{@path}/migrations"

      require_relative 'crowd_fundr_campaign'
    end
  end
end
