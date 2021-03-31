require 'httparty'

class ValidUrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      HTTParty.get(value).ok?
    end
  end
end

class Link < ApplicationRecord
  after_save :set_short_url_id

  include LinksHelper
  include Hashid::Rails
  
  validates :url, presence: true, valid_url: true

  has_many :requests, dependent: :destroy

  def track(request)
    self.click_count += 1
    self.requests.build(device: what_device?(request), ip: request.ip)
    self.save
  end

  private
    def set_short_url_id
      self.short_url = self.hashid
    end
end
