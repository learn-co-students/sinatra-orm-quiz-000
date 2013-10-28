describe "ORMs" do
  ###############################################################################
  # References
  ###############################################################################
  # Sequel querying docs:
  #  http://sequel.rubyforge.org/rdoc/files/doc/querying_rdoc.html
  ###############################################################################
  context "querying" do
    before do
      @path = File.dirname(__FILE__)
      Sequel::Migrator.run DB, "#{@path}/migrations"

      require_relative 'crowd_fundr_campaign'
    end
  end
end
