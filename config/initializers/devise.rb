# frozen_string_literal: true

Devise.setup do |config|
  config.mailer_sender = ENV.fetch('MAIL_SENDER', nil)
  config.secret_key = ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)
  config.mailer = 'ApplicationMailer'
  require 'devise/orm/active_record'

  config.authentication_keys = [:email]
  config.case_insensitive_keys = %i[email username]
  config.strip_whitespace_keys = %i[email username]
  config.reset_password_keys = [:email]
  config.confirmation_keys = [:email]
  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11
  config.invite_for = 1.week
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.scoped_views = true
  config.sign_out_via = :delete
  config.navigational_formats = []
  config.validate_on_invite = true

  config.jwt do |jwt|
    jwt.secret = ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)
    jwt.dispatch_requests = [
      ['POST', %r{^/sign_in}]
    ]
    jwt.revocation_requests = [
      ['DELETE', /sign_out/]
    ]
    jwt.expiration_time = 5.years.to_i
  end
end
# rubocop:enable all
