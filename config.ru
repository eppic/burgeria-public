# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

# Mount under a sub-path (e.g. /burgeria-public for the static GitHub Pages export)
if (relative_url_root = ENV["RAILS_RELATIVE_URL_ROOT"].presence)
  map(relative_url_root) { run Rails.application }
else
  run Rails.application
end
Rails.application.load_server
