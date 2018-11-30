require 'rest-client'
User.destroy_all
Game.destroy_all
Team.destroy_all
League.destroy_all

# USERS #######################################

user_1 = User.create!({
  username: "truxxu",
  email: "dtrujilo69@gmail.com",
  password: "dtrujilo69@gmail.com"
})

user_2 = User.create!({
  username: "ameliebou",
  email: "amelie.boudier01@gmail.com",
  password: "amelie.boudier01@gmail.com"
})

user_3 = User.create!({
  username: "tococorocko",
  email: "luccakaiser@gmail.com",
  password: "luccakaiser@gmail.com"
})

user_4 = User.create!({
  username: "hilsenrath",
  email: "mario.hilsenrath@gmail.com",
  password: "mario.hilsenrath@gmail.com"
})

puts 'Users created'
# TEAMS #######################################

def api_call(league)
  list = RestClient.get "https://api.football-data.org/v2/competitions/#{league}/teams", {'X-Auth-Token' => ENV['FOOTBALL_DATA_TOKEN'] }
  teams = JSON.parse(list)
  teams['teams'].each do |team|
    Team.create(
      name: team['name'],
      logo:
        if team['crestUrl'] == nil
          'https://www.shareicon.net/data/2015/12/22/691473_security_512x512.png'
        else
          team['crestUrl']
        end
      )
  end
  sleep(2)
end

# Premier League Teams
api_call("PL")

# Bundesliga Teams
api_call("BL1")

# La Liga Teams
api_call("PD")

# Serie A Teams
api_call("SA")

puts 'Teams created'

# LEAGUES #######################################

league_1 = League.new({
  name: "La liga"
})
league_1.logo = "https://res.cloudinary.com/digital-pub/image/upload/v1543329234/La_liga.png"
league_1.save

league_2 = League.new({
  name: "Premier League"
})
league_2.logo = "http://res.cloudinary.com/digital-pub/image/upload/v1543333633/Premier_League_Logo.png"
league_2.save

league_3 = League.new({
  name: "Bundesliga"
})
league_3.logo = "http://res.cloudinary.com/digital-pub/image/upload/v1543333995/BundesLiga.png"
league_3.save

league_4 = League.new({
  name: "Serie A"
})
league_4.logo = "https://res.cloudinary.com/digital-pub/image/upload/c_fit,w_750/v1543329234/Serie_A_Logo__ab_2018.png"
league_4.save

puts 'Leagues created'
# GAMES #######################################

def api_matches(league, identifier, num)
  list = RestClient.get "https://api.football-data.org/v2/competitions/#{league}/matches?status=SCHEDULED", {'X-Auth-Token' => ENV['FOOTBALL_DATA_TOKEN'] }
  games = JSON.parse(list)
  games['matches'].first(num).each do |game|
    Game.create(
      team_a_id: Team.find_by(name: game["homeTeam"]["name"]).id,
      team_b_id: Team.find_by(name: game["awayTeam"]["name"]).id,
      kick_off_time: time_conversion(game["utcDate"]),
      league_id: identifier
      )
  end
  sleep(2)
end

def time_conversion(string)
  date = DateTime.parse(string)
  date.strftime('%a, %d %b %y %H:%M:%S')
end

# Matches for Serie A
api_matches("SA", 4, 10)

# Matches for Bundesliga
api_matches("BL1", 3, 10)

# Matches for La Liga
api_matches("PD", 1, 10)

# Matches for Premier League
api_matches("PL", 2, 10)


puts 'Games created'
# FAVOURITE TEAMS #######################################

user_1_fav_team = FavoriteTeam.create!({
  team_id: Team.find_by(name: 'Burnley FC').id,
  user_id: user_1.id
})

user_2_fav_team = FavoriteTeam.create!({
  team_id: Team.find_by(name: 'ACF Fiorentina').id,
  user_id: user_2.id
})

user_3_fav_team = FavoriteTeam.create!({
  team_id: Team.find_by(name: 'AC Milan').id,
  user_id: user_3.id
})

# FAVOURITE LEAGUES #######################################

user_1_fav_league = FavoriteLeague.create!({
  league_id: league_1.id,
  user_id: user_1.id
})

user_2_fav_league = FavoriteLeague.create!({
  league_id: league_2.id,
  user_id: user_2.id
})
puts 'Added favorite teams & leagues to users'

puts 'All done! Enjoy Mario\'s amazing seed :)'
