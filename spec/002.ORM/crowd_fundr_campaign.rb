class CrowdFundrCampaign < ActiveRecord::Base
  def __
    raise "Replace the __ with code to make the test pass"
  end

###CHECK ON THESE AND STUDY MORE SQL!!####
  def self.funded_campaigns
    self.where('total_funding > funding_goal')
  end

  def self.book_campaigns
    self.where("name LIKE ?", "%Book%")
  end

  def self.latest_finish
    self.order("finishing_date DESC").first
  end

end
