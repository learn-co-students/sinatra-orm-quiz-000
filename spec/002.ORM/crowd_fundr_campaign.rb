class CrowdFundrCampaign < ActiveRecord::Base
  def self.funded_campaigns
    funded = []
    self.all.each do |campaign|
      if campaign.total_funding > campaign.funding_goal
        funded << campaign
      end
    end
    funded
  end

  def self.book_campaigns
    book_people = []
    self.all.each do |campaign|
      arr = campaign.name.split(' ')
      if arr.include?('book') || arr.include?('Book')
        book_people << campaign
      end
    end
    book_people
  end

  def self.latest_finish
    dates = self.all.sort_by {|campaign| campaign.finishing_date}
    dates[-1]
  end
end
