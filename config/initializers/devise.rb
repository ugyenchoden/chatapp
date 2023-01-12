# frozen_string_literal: true

Devise.setup do |config|
  config.authentication_keys = [:username]
  config.mailer_sender = ENV.fetch('MAIL_SENDER', nil)
  config.secret_key = 'shopper-on'
  config.parent_controller = 'ApplicationController'
  require 'devise/orm/active_record'
  config.reset_password_keys = [:username]
  config.confirmation_keys = [:username]
  config.case_insensitive_keys = %i[email username]
  config.strip_whitespace_keys = %i[email username]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.validate_on_invite = true
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.timeout_in = ENV.fetch('SESSION_TIMEOUT', 30).to_i
  config.reset_password_within = 10.minutes
  config.scoped_views = true
  config.sign_out_via = :delete
  config.router_name = :telco_uam
  config.confirm_within = 10.minutes
  config.jwt do |jwt|
    jwt.secret = ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)
    jwt.dispatch_requests = [
      ['POST', %r{^/sign_in$}]
    ]
    jwt.revocation_requests = [
      ['DELETE', %r{^/sign_out$}]
    ]
    jwt.expiration_time = 15.days.to_i
  end
end
