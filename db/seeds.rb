require 'rest-client'
User.destroy_all
Game.destroy_all
Team.destroy_all
League.destroy_all

# USERS #######################################

user_1 = User.create!({
  username: "ValderramaHairStyle",
  email: "dtrujilo69@gmail.com",
  password: "dtrujilo69@gmail.com",
  score: 69
})

user_2 = User.create!({
  username: "DieuZizou",
  email: "amelie.boudier01@gmail.com",
  password: "amelie.boudier01@gmail.com",
  score: 74
})

user_3 = User.create!({
  username: "tococorocko",
  email: "luccakaiser@gmail.com",
  password: "luccakaiser@gmail.com",
  score: 58
})

user_4 = User.create!({
  username: "TeleSantana",
  email: "mario.hilsenrath@gmail.com",
  password: "mario.hilsenrath@gmail.com",
  score: 49
})

user_5 = User.create!({
  username: "CR7_special_guy",
  email: "u1@gmail.com",
  password: "u1@gmail.com",
  score: 72
})

user_6 = User.create!({
  username: "R9_monster",
  email: "u2@gmail.com",
  password: "u2@gmail.com",
  score: 40
})

user_7 = User.create!({
  username: "NJ_cry_baby",
  email: "u3@gmail.com",
  password: "u3@gmail.com",
  score: 24
})

user_8 = User.create!({
  username: "maradona_82",
  email: "u4@gmail.com",
  password: "u4@gmail.com",
  score: 23
})

user_9 = User.create!({
  username: "Kaiser_Beckenbauer",
  email: "u5@gmail.com",
  password: "u5@gmail.com",
  score: 70
})

user_10 = User.create!({
  username: "best_George",
  email: "u6@gmail.com",
  password: "u6@gmail.com",
  score: 55
})

User.create(username: 'Admin', email: 'admin@digital-pub.live', password: 'admin@digital-pub.live', admin: true )

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
league_1.logo = "http://res.cloudinary.com/digital-pub/image/upload/c_pad,h_380,w_380/v1543329234/La_liga.png"
league_1.save

league_2 = League.new({
  name: "Premier League"
})
league_2.logo = "http://res.cloudinary.com/digital-pub/image/upload/v1543333633/Premier_League_Logo2.png"
league_2.save

league_3 = League.new({
  name: "Bundesliga"
})
league_3.logo = "http://res.cloudinary.com/digital-pub/image/upload/v1543333995/BundesLiga2.png"
league_3.save

league_4 = League.new({
  name: "Serie A"
})
league_4.logo = "https://res.cloudinary.com/digital-pub/image/upload/c_pad,h_380,w_380/v1543329234/Serie_A_Logo__ab_2018.png"
league_4.save

puts 'Leagues created'

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
