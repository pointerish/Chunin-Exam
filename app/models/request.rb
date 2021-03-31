class Request < ApplicationRecord
  validates :ip, presence: true
  validates :device, presence: true

  belongs_to :link
end
