# config/initializers/webdrivers.rb

# Force webdrivers to use a known ChromeDriver version
# Replace "142.0.7444.0" with your installed Chrome version
Webdrivers::Chromedriver.required_version = "114.0.5735.90"

# Optional: automatically update to the correct driver version in future
Webdrivers::Chromedriver.update if Rails.env.test?
