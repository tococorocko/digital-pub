namespace :chat do
  desc "Changes status to online one hour before the game"
  task toggle_status: :environment do
    puts 'Fetching games'
    games = Game.all
    games.each do |game|
      puts 'Looking for chats'
      chats = Chat.where(game_id: game.id)
      chats.each do |chat|
        if game.kick_off_time - Time.now.utc < 3600 && game.kick_off_time - Time.now.utc > 0 || Time.now.utc - game.kick_off_time > 0 && Time.now.utc - game.kick_off_time < 21600
          puts 'Bringing chats online'
          chat.update(online: true)
        elsif Time.now.utc - game.kick_off_time > 21600
          puts 'Destroying chats'
          chat.destroy
        else
          puts 'Bringing chats offline'
          chat.update(online: false)
        end
      end
    end
  end
end
