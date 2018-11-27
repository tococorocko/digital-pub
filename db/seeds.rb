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
team_1.logo = "https://www.ogol.com.br/img/logos/equipas/40_imgbank.png"
team_1.save

team_2 = Team.new({
  name: "Atlético de Madrid"
})
team_2.logo = "https://upload.wikimedia.org/wikipedia/pt/1/19/AtleticoMadrid2017.png"
team_2.save

team_3 = Team.new({
  name: "Manchester United FC"
})
team_3.logo = "https://upload.wikimedia.org/wikipedia/pt/b/b6/Manchester_United_FC_logo.png.png"
team_3.save

puts 'Teams created'
# LEAGUES #######################################

league_1 = League.new({
  name: "La liga"
})
league_1.logo = "http://a2.espncdn.com/combiner/i?img=%2Fi%2Fleaguelogos%2Fsoccer%2F500%2F15.png"
league_1.save

league_2 = League.new({
  name: "UEFA Champions League"
})
league_2.logo = "https://upload.wikimedia.org/wikipedia/pt/9/9b/116px-UEFA_Champions_League_logo_2_svg.png"
league_2.save

puts 'Leagues created'
# GAMES #######################################

game_1 = Game.create!({
  team_a_id: team_1.id,
  team_b_id: team_2.id,
  league_id: league_1.id,
  kick_off_time: "Sat, 01 Dec 2018 16:00:00"
})

game_2 = Game.create!({
  team_a_id: team_3.id,
  team_b_id: team_1.id,
  league_id: league_2.id,
  kick_off_time: "Wen, 05 Dec 2018 14:00:00"
})

game_3 = Game.create!({
  team_a_id: team_2.id,
  team_b_id: team_1.id,
  league_id: league_2.id,
  kick_off_time: "Sat, 08 Dec 2018 10:00:00"
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
