class Link < ApplicationRecord

  include LinksHelper
  include Hashid::Rails
  
  validates :url, presence: true, valid_url: true

  has_many :requests, dependent: :destroy

  def track(request)
    self.click_count += 1
    self.requests.build(device: what_device?(request),
                        ip: request.ip)
    self.save
  end

  def to_s
    self.url
  end
end
