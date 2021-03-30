class Link < ApplicationRecord
  validates :url, presence: true, url: true
end
