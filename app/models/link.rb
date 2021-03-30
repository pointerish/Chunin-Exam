class Link < ApplicationRecord
  validates :url, presence: true, valid_url: true
end
