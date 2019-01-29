require 'json'
require 'httparty'
require_relative '../lib/football'
require 'dotenv'

Dotenv.load('.env')

RSpec.configure do |config|
  config.formatter = :documentation
end
