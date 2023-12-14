# require 'faraday'

# GITHUB_API_URL = 'https://api.github.com/'.freeze

# GithubClient = Faraday.new(url: GITHUB_API_URL) do |faraday|
#   faraday.headers['Authorization'] = "Bearer #{ENV['GITHUB_API_TOKEN']}"
#   faraday.adapter Faraday.default_adapter
# end