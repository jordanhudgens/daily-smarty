ActionMailer::Base.smtp_settings = {
    port:                 ENV.fetch 'SPARKPOST_PORT',
    address:              ENV.fetch 'SPARKPOST_HOST',
    user_name:            ENV.fetch 'SPARKPOST_USERNAME',
    password:             ENV.fetch 'SPARKPOST_PW',
    authentication:       :login,
    enable_starttls_auto: true
}
ActionMailer::Base.delivery_method = :smtp
