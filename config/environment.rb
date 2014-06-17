# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Brk2014::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'your_sendgrid_username',
  :password => 'your_sendgrid_password',
  :domain => 'brk2014.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
