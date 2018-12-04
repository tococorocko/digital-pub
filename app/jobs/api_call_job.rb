require 'rest-client'

class ApiCallJob < ApplicationJob
  queue_as :default

  def perform(league, identifier, num)
    list = RestClient.get "https://api.football-data.org/v2/competitions/#{league}/matches?status=SCHEDULED", {'X-Auth-Token' => ENV['FOOTBALL_DATA_TOKEN'] }
    games = JSON.parse(list)
    games['matches'].first(num).each do |game|
      unless Game.find_by(team_a_id: Team.find_by(name: game["homeTeam"]["name"]).id,
                          team_b_id: Team.find_by(name: game["awayTeam"]["name"]).id,
                          kick_off_time: game["utcDate"])
        Game.create(
          team_a_id: Team.find_by(name: game["homeTeam"]["name"]).id,
          team_b_id: Team.find_by(name: game["awayTeam"]["name"]).id,
          kick_off_time: game["utcDate"],
          league_id: identifier
          )
      end
    end
  end
end
