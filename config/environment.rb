# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Thread.new { VmCollectorJob.perform_now }
