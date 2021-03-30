require 'httparty'

class ValidURLValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      HTTParty.get(value).ok?
    end
  end
end