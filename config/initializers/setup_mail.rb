ActionMailer::Base.smtp_settings = {
  user_name:            ENV.fetch('SPARKPOST_USERNAME'),
  password:             ENV.fetch('SPARKPOST_PW'),
  address:              ENV.fetch('SPARKPOST_HOST'),
  port:                 ENV.fetch('SPARKPOST_PORT'),
  enable_starttls_auto: true,
  format: :html,
  from: 'support@dailysmarty.com'
}
