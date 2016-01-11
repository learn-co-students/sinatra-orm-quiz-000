class CrowdFundrCampaign < ActiveRecord::Base
  def self.funded_campaigns
  	self.where("total_funding >= funding_goal")
  end

  def self.book_campaigns
  	self.where("name LIKE '%book%'")
  end

  def self.latest_finish
  	self.order(finishing_date: :desc).take
  end

  def __
    raise "Replace the __ with code to make the test pass"
  end

end
