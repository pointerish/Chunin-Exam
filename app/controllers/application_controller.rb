class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
  self.per_form_csrf_tokens = true
end
