class Link < ApplicationRecord
  include LinksHelper
  include Hashid::Rails

  validates :url, presence: true, url: true

  has_many :requests, dependent: :destroy

  def track(request)
    self.click_count += 1
    requests.build(device: what_device?(request),
                   ip: request.ip)
    save
  end

  def to_s
    url
  end
end
