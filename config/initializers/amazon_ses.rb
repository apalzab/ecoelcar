ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :access_key_id     => ENV['aws_ses_access_key'],
  :secret_access_key => ENV['aws_ses_secret_access_key'],
  :server => ENV['aws_ses_server']
