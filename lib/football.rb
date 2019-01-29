require 'json'

class FootballAPI

  attr_accessor :json_data

  def initialize(json)
    @json_data = JSON.parse(json)
  end

  def retrieve_start_date
    @json_data['competitions']['currentSeason']['startDate']
  end

  def retrieve_end_date
    @json_data['competitions']['currentSeason']['endDate']
  end

end

# test = FootballAPI
# test.retrieve_start_date