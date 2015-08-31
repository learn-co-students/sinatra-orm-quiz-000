class CrowdFundrCampaign < ActiveRecord::Base
  def self.funded_campaigns
    CrowdFundrCampaign.where('funding_goal <= total_funding')
  end

  def self.book_campaigns
    CrowdFundrCampaign.where("name LIKE ?", "%book%")
  end

  def self.latest_finish
    CrowdFundrCampaign.order(finishing_date: :desc).first
  end

end
