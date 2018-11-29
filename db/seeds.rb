# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
  email: "lucca.kaiser@gmail.com",
  password: "lucca.kaiser@gmail.com"
})

user_4 = User.create!({
  username: "hilsenrath",
  email: "mario.hilsenrath@gmail.com",
  password: "mario.hilsenrath@gmail.com"
})

puts 'Users created'
# TEAMS #######################################

team_1 = Team.new({
  name: "FC Barcelona"
})
team_1.logo = "https://res.cloudinary.com/digital-pub/image/upload/v1543329234/Barcelona.png"
team_1.save

team_2 = Team.new({
  name: "Atlético de Madrid"
})
team_2.logo = "https://res.cloudinary.com/digital-pub/image/upload/v1543329234/Atletico_Madrid_logo_neu.png"
team_2.save

team_3 = Team.new({
  name: "Manchester United FC"
})
team_3.logo = "https://res.cloudinary.com/digital-pub/image/upload/v1543329235/Manchester_United_FC_logo.png"
team_3.save

team_4 = Team.new({
  name: "Manchester City FC"
})
team_4.logo = "https://res.cloudinary.com/digital-pub/image/upload/v1543329235/Manchester_City_FC_badge.svg.png"
team_4.save

team_5 = Team.new({
  name: "Liverpool FC"
})
team_5.logo = "https://res.cloudinary.com/digital-pub/image/upload/v1543329235/Liverpool_FC.png"
team_5.save

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

game_1 = Game.create!({
  team_a_id: team_1.id,
  team_b_id: team_2.id,
  league_id: league_1.id,
  kick_off_time: "Wed, 28 Nov 2018 17:00:00"
})

game_2 = Game.create!({
  team_a_id: team_3.id,
  team_b_id: team_4.id,
  league_id: league_1.id,
  kick_off_time: "Wed, 28 Nov 2018 16:00:00"
})

game_3 = Game.create!({
  team_a_id: team_3.id,
  team_b_id: team_5.id,
  league_id: league_1.id,
  kick_off_time: "Sat, 08 Dec 2018 10:00:00"
})

game_4 = Game.create!({
  team_a_id: team_4.id,
  team_b_id: team_5.id,
  league_id: league_1.id,
  kick_off_time: "Sun, 09 Dec 2018 10:00:00"
})

game_5 = Game.create!({
  team_a_id: team_2.id,
  team_b_id: team_1.id,
  league_id: league_1.id,
  kick_off_time: "Wed, 28 Nov 2018 21:00:00"
})

puts 'Games created'
# FAVOURITE TEAMS #######################################

user_1_fav_team = FavoriteTeam.create!({
  team_id: team_1.id,
  user_id: user_1.id
})

user_2_fav_team = FavoriteTeam.create!({
  team_id: team_2.id,
  user_id: user_2.id
})

user_3_fav_team = FavoriteTeam.create!({
  team_id: team_3.id,
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
