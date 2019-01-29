require 'spec_helper'

describe 'football api' do

  before(:all) do
    # @api_key = ENV['FOOTBALL_API_KEY']
    @football_data = FootballAPI.new(HTTParty::get('http://api.football-data.org/v2/competitions/').body).json_data
  end

  it 'should be a hash' do
    expect(@football_data).to be_kind_of(Hash)
  end

  it 'should have Premier League football played in England' do 
    (@football_data['competitions']['name']).each do |compName|
      if compName == 'Premier League' then
        expect(@football_data['competitions']['area']['name']).to be('England')
      end
    end
  end

  it 'should have competitions end after they start' do
    @football_data['competitions']['currentSeason'].each do |dates|
      expect(dates['startDate'] <=> dates['endDate']).to eq(1)
    end
  end

  it 'should have nine keys for each competition' do 
    @football_data['competitions'].each do |keys|
      expect(keys.count).to eq(9)
    end
  end

end
