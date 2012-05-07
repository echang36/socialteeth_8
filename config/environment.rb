# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Socialteeth8::Application.initialize!


require "active_merchant"

FORMAT=["Video", "Audio", "Print"]