class CrowdFundrCampaign < ActiveRecord::Base

  def self.funded_campaigns
    CrowdFundrCampaign.all.select do |campaign|
    	campaign.total_funding > campaign.funding_goal
    end
  end

  def self.book_campaigns
  	CrowdFundrCampaign.all.select do |campaign|
  		campaign.name.include? "Book"
  	end
  end

  def self.latest_finish
  	array = []
  	CrowdFundrCampaign.all.each do |campaign|
  		array << campaign.finishing_date
  	end
  	latest_date = array.sort.last
  	CrowdFundrCampaign.find_by(finishing_date: latest_date)
  end

end
